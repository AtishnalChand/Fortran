import numpy as np
from pyDOE import lhs

# Reaction Rate constant: k(T) = A exp(-E/RT) where A = frequency factor, E = activation energy, R = gas constant
# T = Temperature

# Define the number of variables and number of samples
num_variables = 6
num_samples = 10

# Generate the random samples using Latin Hypercube Sampling
samples = lhs(num_variables, samples=num_samples)

# Scale the samples to cover more than 90% of the distribution probability (two times standard derivation)
# N2+ + O -> NO+ + N(2D) + 0.70 eV if ti <= 1500.0 then rr = 1.33e-16 * ti3m044  A1 = 1.33e-16
A1 = 1.33e-16
rel_unc1 = 0.20
unc_range1 = A1 * rel_unc1
lhs1 = A1 - unc_range1 + 2 * unc_range1 * samples[:, 0]

# N2+ + O ->  NO+ + N(4S) + 3.08 eV ti => 1500.0 then rr = 6.55e-17 * ti15m023    A2 = 6.55e-17
A2 = 6.55e-17
rel_unc2 = 0.20
unc_range2 = A2 * rel_unc2
lhs2 = A2 - unc_range2 + 2 * unc_range2 * samples[:, 1]

# N2+ + e -> 2 N(2D) + 1.04 eV and N2+ + e -> 2 N(4S) + 5.77 eV rr = 2.2e-13 * te3m039  A3 = 2.2e-13
A3 = 2.2e-13
rel_unc3 = 0.20
unc_range3 = A3 * rel_unc3
lhs3 = A3 - unc_range3 + 2 * unc_range3 * samples[:, 2]

# N2+ + N(4S) -> N2 + N+ + 2.48 eV   rr = 1.0e-17 A4 = 1.0e-17
A4 = 1.0e-17
rel_unc4 = 0.20
unc_range4 = A4 * rel_unc4
lhs4 = A4 - unc_range4 + 2 * unc_range4 * samples[:, 3]

# N2+ + O -> O+(4S) + N2 + 1.96 eV rr = 7.0e-18 * ti3m023 A5 =  7.0e-18
A5 = 7.0e-18
rel_unc5 = 0.20
unc_range5 = A5 * rel_unc5
lhs5 = A5 - unc_range5 + 2 * unc_range5 * samples[:, 4]

# N2+ + NO -> NO+ + N2 + 6.33 eV rr = 3.6e-16  ! Richards  A6 = 3.6e-16
A6 = 3.6e-16
rel_unc6 = 0.20
unc_range6 = A6 * rel_unc6
lhs6 = A6 - unc_range6 + 2 * unc_range6 * samples[:, 5]

# Concatenate the samples into a matrix
lhs = np.column_stack((lhs1, lhs2, lhs3, lhs4, lhs5, lhs6))

# Write the results to a CSV file
header = ['A1', 'A2', 'A3', 'A4', 'A5', 'A6']
np.savetxt("random_samples.csv", lhs, delimiter=",", header=",".join(header), comments="")
