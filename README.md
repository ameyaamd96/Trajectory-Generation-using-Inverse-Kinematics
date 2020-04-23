# Trajectory-Generation-using-Inverse-Kinematics
Handled singularities by using different working modes to generate trajectories using Inverse Kinematics

Use of four working modes to handle the singularities of the parallel robot manipulator
The code generates some basic trajectory shapes mainly to demonstrate that by switching working modes, type 2 singularities can be effectively handled

The five bar equal length parallel manipulator DexTAR was studied in detail. The forward kinematics and inverse kinematics equations, jacobian and the formulations for Inertia matrix (Joint Space) and Mass Matrix (Cartesian space) were calculated. The use of equal link lengths makes optimal use of workspace and is free of any holes, but has the drawback of more singularities, and
hence reduced degrees of freedom in such scenarios. Using the concept of modes of operation and associated singularity free zones, the end effector position could be traced along four different paths using a MATLAB script without encountering any Type II singularities.
