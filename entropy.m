function S = entropy(A)
% Input: transition probability matrix A, where A_{ij} is the probability
% of transitioning from i to j
%
% Output: Entropy rate S of the Markov process defined by A. Entropy is
% measured in bits.

% G = double(A > 0);
% P = sum(G,2)'/sum(sum(G));

% Modification by Suman: sticking in the 'largestreal' just as a precaution since we are dealing with directed networks.

[P,~] = eigs(A',1, 'largestreal');
P = P'/sum(P);

% Calculate entropy:
logA = log2(A);
logA(isinf(logA)) = 0;

S = -P*sum(A.*logA,2);
