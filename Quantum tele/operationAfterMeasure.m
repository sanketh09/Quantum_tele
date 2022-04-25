function [ qBit ] = operationAfterMeasure( firstQBit, secondQBit, teleportedQBitDensityMatrix )
%
% Function that applies an operation on the teleportedQBit according to the two measured qBits
% 
% @returns array when success, -1 when failure
%

    % Constants
    ket0 = [1; 0];
    ket1 = [0; 1];
    sigmaX = [0 1; 1 0];
    sigmaY = [0 -i; i 0];
    sigmaZ = [1 0;0 -1];

    qBit = -1;

    if (firstQBit == ket0)
        if (secondQBit == ket0)
           qBit = teleportedQBitDensityMatrix;
        elseif (secondQBit == ket1)
            qBit = sigmaX * teleportedQBitDensityMatrix * sigmaX';
        end
    elseif (firstQBit == ket1)
        if (secondQBit == ket0)
           qBit = sigmaZ * teleportedQBitDensityMatrix * sigmaZ';
        elseif (secondQBit == ket1)
            qBit = sigmaX * (sigmaZ * teleportedQBitDensityMatrix * sigmaZ) * sigmaX;
        end
    end

end

