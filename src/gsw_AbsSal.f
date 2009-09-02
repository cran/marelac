
c ******************************************************************
c This is the gsw Absolute Salinity algorithm implemented in Fortran
c ******************************************************************
c
c as defined in
c
c   McDougall, T.J., Jackett, D.R. and Millero, F.J., 2009: An algorithm for estimating
c                       Absolute Salinity in the global ocean,
c                       Ocean Science,   Discussions 6, 215-242.
c
c
c David Jackett
c January 2009
c
c Karline Soetaert - May 2009: made subroutines instead of functions
c                              isnan -> -99
c
c******************************************************************************

c******************************************************************************

        SUBROUTINE gsw_delta_sa(p0,longs0,lats0,longs,lats,p,ndepth,           &
     &                         del_sa,delta)

c calculate the Absolute Salinity anomaly
c
c SP                  : Practical Salinity                 [psu]
c p0                  : sea (gauge) pressure               [dbar]
c longs0              : longitude                          [deg E]
c lats0               : latitude                           [deg N]
c
c result              : Absolute Salinity anomaly          [g/kg]

        implicit none

        integer nx, ny, nz
        parameter(nx=91,ny=44,nz=45)

        integer indx0, indy, indz 
        integer k, deli(4), delj(4) 
        real*8 p0, p0_original, longs0, lats0, sa_upper
        real*8 sa_lower, delta
        real*8 longs(nx), lats(ny), p(nz), del_sa(nz,ny,nx)
            real*8 dlongs, dlats
        real*8 r1, s1, t1, dsa(4), ndepth(ny,nx), ndepth_max
        logical ISNAN

        data deli/0,1,1,0/, delj/0,0,1,1/

        dlongs = longs(2)-longs(1)
              dlats = lats(2)-lats(1)

        indx0 = floor(1 + (nx-1)*(longs0-longs(1))/(longs(nx)-longs(1)))
        if(indx0.eq.nx) then
         indx0 = nx-1
        end if

        indy = floor(1 + (ny-1)*(lats0-lats(1))/(lats(ny)-lats(1)))
        if(indy.eq.ny) then
         indy = ny-1
        end if

        ndepth_max = -1.d0
        do k = 1,4
         if(ndepth(indy+delj(k),indx0+deli(k)).gt.0.d0)                        &
     &    ndepth_max =max(ndepth_max,ndepth(indy+delj(k),indx0+deli(k)))
        end do

        if(ndepth_max.eq.-1.d0) then
         delta = 0.d0 !/0.
         return
        end if    

        p0_original = p0

        if(p0.gt.p(int(ndepth_max))) p0 = p(int(ndepth_max))

        call indx(p,nz,p0,indz)
    
        r1 = (longs0-longs(indx0))/(longs(indx0+1)-longs(indx0))
        s1 = (lats0-lats(indy))/(lats(indy+1)-lats(indy))
        t1 = (p0-p(indz))/(p(indz+1)-p(indz))

        isnan = .FALSE.
        do k = 1,4
            dsa(k) = del_sa(indz,indy+delj(k),indx0+deli(k))
            if (dsa(k) .LE. -90) isnan=.TRUE. 
        end do

        if(260.d0.le.longs0.and.longs0.le.291.999d0.and.                       &
     &     3.4d0.le.lats0.and.lats0.le.19.55d0) then
           CALL dsa_add_barrier(dsa,longs0,lats0,longs(indx0),                 &
     &           lats(indy),dlongs,dlats)

        elseif(isnan) then 
          call dsa_add_mean(dsa)
        end if

        sa_upper = (1.d0-s1)*(dsa(1) + r1*(dsa(2)-dsa(1))) + s1*(dsa(4)        &
     &      +  r1*(dsa(3)-dsa(4)))

        isnan = .FALSE.
        do k = 1,4
            dsa(k) = del_sa(indz+1,indy+delj(k),indx0+deli(k))
            if (dsa(k) .LE. -90) isnan=.TRUE.
        end do

        if(260.d0.le.longs0.and.longs0.le.291.999d0.and.3.4d0.le.lats0         &
     &      .and.lats0.le.19.55d0) then
            CALL dsa_add_barrier(dsa,longs0,lats0,longs(indx0),                &
     &     lats(indy),dlongs,dlats)
        elseif(isnan) then 
            isnan = .FALSE.
            call dsa_add_mean(dsa)
            do k=1,4
              if (dsa(k) .LE. -90) isnan=.TRUE.
            enddo 
        end if

        sa_lower = (1.d0-s1)*(dsa(1) + r1*(dsa(2)-dsa(1))) + s1*(dsa(4)        &
     &    + r1*(dsa(3)-dsa(4)))

        if(isnan) sa_lower = sa_upper
                            
        delta = sa_upper + t1*(sa_lower-sa_upper)

c        if(isnan(delta)) delta = 0.d0

c        p0 = p0_original
  
        return
        end


c******************************************************************************

       subroutine dsa_add_barrier(dsa,longs0,lats0,longs,lats,                 &
     &        dlongs,dlats)

c add a barrier through Central America (Panama) and then average
c over the appropriate side of the barrier
c
c dsa                 : absolute salinity anomaly                [g/kg]
c longs0              : longitudes of data                       [deg E]
c lats0               : latitudes of data                        [deg N]
c longs               : longitudes of regular grid               [deg E]
c lats                : latitudes of regular grid                [deg N]
c dlongs              : longitude difference of regular grid     [deg longitude]
c dlats               : latitudes difference of regular grid     [deg latitude]
c
c result              : absolute salinity anomaly of data        [g/kg]

       implicit none

       integer k, nmean, above_line0, above_line(4)

       real*8 dsa_add(4), dsa(4), dsa_mean
       real*8 longs_pan(6), lats_pan(6), longs0, lats0, r, lats_line
       real*8 longs, lats, dlongs, dlats

       data longs_pan/260.0000, 272.5900, 276.5000, 278.6500,                  &
     &      280.7300, 292.000/ 
       data  lats_pan/ 19.5500,  13.9700,   9.6000,   8.1000,                  &
     &      9.3300,   3.400/ 

c   the long0/lat0 point
        call indx(longs_pan,6,longs0,k)
        r = (longs0-longs_pan(k))/(longs_pan(k+1)-longs_pan(k))
        lats_line = lats_pan(k) + r*(lats_pan(k+1)-lats_pan(k))
        if(lats_line.le.lats0) then
            above_line0 = 1
        else
            above_line0 = 0
        end if

c print *, 'above_line = ', above_line0
c  the 1 and 4 long/lat points
        call indx(longs_pan,6,longs,k)
        r = (longs-longs_pan(k))/(longs_pan(k+1)-longs_pan(k))
        lats_line = lats_pan(k) + r*(lats_pan(k+1)-lats_pan(k))
        if(lats_line.le.lats) then
            above_line(1) = 1
        else
            above_line(1) = 0
        end if
        if(lats_line.le.lats+dlats) then
            above_line(4) = 1
        else
            above_line(4) = 0
        end if
        
c  the 2 and 3 long/lat points
        call indx(longs_pan,6,longs+dlongs,k)
        r = (longs+dlongs-longs_pan(k))/(longs_pan(k+1)-longs_pan(k))
        lats_line = lats_pan(k) + r*(lats_pan(k+1)-lats_pan(k))
        if(lats_line.le.lats) then
            above_line(2) = 1
        else
            above_line(2) = 0
        end if
        if(lats_line.le.lats+dlats) then
            above_line(3) = 1
        else
            above_line(3) = 0
        end if

        nmean = 0
        dsa_mean = 0.d0
        dsa_add = dsa
        do k = 1,4
            if (dsa(k).GT.-90.and.above_line0.eq.above_line(k)) then
                nmean = nmean+1 
                  dsa_mean = dsa_mean+dsa(k)
            end if
        end do

        dsa_mean = dsa_mean/nmean

        do k = 1,4
            if(dsa(k).LE. -90 .or.above_line0.ne.above_line(k)) then
                 dsa_add(k) = dsa_mean
            end if
        end do

        dsa = dsa_add
        return
        end

c******************************************************************************

        subroutine dsa_add_mean(dsa)

c replace nans with namean
c
c dsa           : absolute salinity anomaly                [g/kg]
c                 of the 4 adjacent neighbours
c
c result        : nanmean of the 4 adjacent neighbours     [g/kg]

        implicit none

        integer k, nmean
        real*8 dsa(4)
        real*8 dsa_mean, dsa_add(4)

        nmean = 0
        dsa_mean = 0.d0
        dsa_add = dsa

        do k = 1,4
            if (dsa(k).GT. -90) then
                nmean = nmean+1 
                  dsa_mean = dsa_mean+dsa(k)
            end if
        end do

        dsa_mean = dsa_mean/nmean

        do k = 1,4
            if(dsa(k).LE. -90) then
                 dsa_add(k) = dsa_mean
            end if
        end do

        dsa = dsa_mean
        return
        end

c******************************************************************************

        subroutine indx(x,n,z,k)

c   DESCRIPTION:    Find the index of a real number in a
c                   monotonically increasing real array
c
c   INPUT:          x       array of increasing values
c                   n       length of array
c                   z       real number
c
c   OUTPUT:         k       index k - if x(k) <= z < x(k+1), or
c                   n-1             - if z = x(n)
c
c   CREATED:        June 1993
c

       implicit none
         character(len=80) msg

       integer n,k,ku,km,kl
         real*8 x(n),z

       if(x(1).lt.z.and.z.lt.x(n)) then

         kl=1
         ku=n

         do while (ku-kl.gt.1)
           km=(ku+kl)/2
           if(z.gt.x(km))then
             kl=km
           else
             ku=km
           endif
         end do

         k=kl

         if(z.eq.x(k+1)) k = k+1

       else

        if(z.eq.x(1)) then
          k = 1
        elseif(z.eq.x(n)) then
          k = n-1
        else
          call rwarn("ERROR in indx.f : out of range")
          write (msg,*) z,n,x
          call rexit(msg)
        end if

      end if

      return
      end

c******************************************************************************

        function xinterp1(x,y,n,x0)

c linearly interpolate a real array
c
c x                   : x array (monotonic)
c y                   : y array
c n                   : length of x and y arrays
c x0                  : x value to be interpolated
c
c result              : interpolated value

        implicit none
        integer n, k
        real*8 x(n), y(n), x0, r, xinterp1

        call indx(x,n,x0,k)

        r = (x0-x(k))/(x(k+1)-x(k))

        xinterp1 = y(k) + r*(y(k+1)-y(k))

        return
        end

c******************************************************************************
