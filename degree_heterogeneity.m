function [deg_het_in, deg_het_out] = degree_heterogeneity(G)
% Input: (Possibly directed) adjacency matrix G
%
% Outputs: in-degree heterogeneity deg_het_in and out-degree heterogeneity
% deg_het_out. Note: if G is symmetric, then deg_het_in = deg_het_out.

% Size of network:
N = size(G, 1);

% In- and out-degrees:
ks_in = sum(G,1)';
ks_out = sum(G,2);

% Compute degree heterogeneities:
deg_het_in = var(ks_in)/(mean(ks_in))^2;
deg_het_out = var(ks_out)/(mean(ks_out))^2;
