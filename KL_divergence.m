function DKL = KL_divergence(A, Ahat)
% Input: Transition probability matrix A, where A_{ij} is the probability
% of transitioning from i to j, and estimated transition probability matrix
% Ahat (typically representing human expectations).
%
% Output: KL divergence DKL between the Markov process A and the beliefs
% Ahat, measured in bits.

[pi, ~] = eigs(A',1,'largestreal');
pi = pi/sum(pi);

% Calculate KL divergence:
logAhat = log2(Ahat);
logAhat(isinf(logAhat)) = 0;

logA = log2(A);
logA(isinf(logA)) = 0;

DKL = -pi'*sum(A.*(logAhat - logA),2);
