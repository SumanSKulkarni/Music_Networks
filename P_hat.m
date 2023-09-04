function Phat = P_hat(P, beta)
% Takes in transition probability matrix P and human graph learning
% parameter beta and computes human expectations P_hat (also a transition
% probability matrix

N = size(P,1);
Phat = (1-exp(-beta))*P/(eye(N) - exp(-beta)*P);
