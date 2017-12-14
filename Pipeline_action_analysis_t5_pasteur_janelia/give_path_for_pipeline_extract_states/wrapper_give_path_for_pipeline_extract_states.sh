#!/bin/bash

date

hostname

export MCR_CACHE_VERBOSE=0

if [ -d /local/scratch/$USER ]; then
 mkdir /local/scratch/${USER}
 export MCR_CACHE_ROOT=/local/scratch/$USER/mcr_cache_root.${SLURM_JOB_ID}
else
 export MCR_CACHE_ROOT=~/mcr_cache_root.${SLURM_JOB_ID}
fi

if [ -d MCR_CACHE_ROOT ] ; then
  echo Deleting pre-existing MCR_CACHE_ROOT
  rm -rf $MCR_CACHE_ROOT
fi

mkdir $MCR_CACHE_ROOT

sh run_give_path_for_pipeline_extract_states.sh /local/gensoft2/exe/matlab/R2016b/ $1 $2

rm -rf $MCR_CACHE_ROOT

date
