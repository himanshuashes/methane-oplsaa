#!/bin/bash
#PBS -o logfile.log
#PBS -e errorfile.err
#PBS -l walltime=100:00:00
#PBS -l select=1:ncpus=8
#PBS -N butane_small
tpdir=`echo $PBS_JOBID | cut -f 1 -d .`
tempdir=$HOME/scratch/job$tpdir
mkdir -p $tempdir
cd $tempdir
cp -R $PBS_O_WORKDIR/* .
module purge
module load openmpi405 gcc920 intel2020.2

mpiexec.hydra -np 8 -genv OMP_NUM_THREADS=1 -genv I_MPI_PIN=1 -genv I_MPI_FABRICS=shm:ofi -machinefile ${PBS_NODEFILE} --ppn 2 /lfs/usrhome/ms/ch21s007/softwares/lammps-29Sep2021/src/lmp_mpi -i run.in.npt
mv ../job$tpdir $PBS_O_WORKDIR/.
