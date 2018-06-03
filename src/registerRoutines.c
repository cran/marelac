// RegisteringDynamic Symbols
#include<R_ext/Rdynload.h>
#ifndef R_R_H
#  include <R.h>
#endif

/*
  SUBROUTINE gsw_delta_sa(p0,longs0,lats0,longs,lats,p,ndepth,           &
     &                         del_sa,delta)
*/    


void F77_NAME(gsw_delta_sa)(double*, double*,  double*, double*, double*, int*, double*, double*);
     

R_FortranMethodDef marelacfortranMethods[] = {
 {"gsw_delta_sa",(DL_FUNC) &F77_SUB(gsw_delta_sa), 8},
 {NULL, NULL, 0}
};

void R_init_OceanView(DllInfo *info) {
  R_registerRoutines(info, NULL, NULL, marelacfortranMethods, NULL);
  R_useDynamicSymbols(info, FALSE); // disable dynamic searching  
}

