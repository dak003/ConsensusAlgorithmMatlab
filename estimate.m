function delta_est = estimate(se_in, neighbors, N)
% FILE: estimate.m implemenets a consensus-based estimation protocol
%
% DESCRIPTION:
% Each agent updates their own estimate of a sensor value by applying the
% consensus protocol with its neighbors.
%
% INPUTS:
% se_in - everyone's original sensor estimates
%
% OUTPUTS:
% delta_est - the change in estimate required to arrive at a consensus with
% neighbors about the estimate
%
% TODO:
% Become resilient to estimates from unknown, bad faith actors

%% Authors: Safwan Alam, Musad Haque - 2019
%%%%%%%%%%%%%

delta_est = zeros(N, 1);

for ii = 1:1:N
    for jj = 1:1:N
        if (ii ~= jj) && neighbors(ii, jj)
            %add ~20% random uninformed vote to fight malicious actor vote
            randval = randi(10);
            if (randval > 2)
            %Regular consensus with neighbors
            %Susceptible to bad faith actors
                delta_est(ii, 1) = (delta_est(ii, 1) - (se_in(ii, 1) - se_in(jj, 1)));
            else
                delta_est(ii, 1) = randval;
            end
        end
    end
end
               
        
end


