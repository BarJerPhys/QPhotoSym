
import Quipper
import Quantum.Synthesis.RotationDecomposition
import Quantum.Synthesis.Matrix
import Quantum.Synthesis.Ring
import Quipper.Libraries.Synthesis

import Data.Complex
import Data.Ratio



disp_error :: Matrix Four Four (Cplx Float) -> IO()
disp_error x = do
 print "------------    Resultant errors of decomposing the basis transformation matrix    ---------------"
 print x

-- define 4 x 4 matrix constructor
--  mytranspose is the basis transformation matrix for a four molecule system
mytranspose :: Matrix Four Four (Cplx Float)
mytranspose = matrix [[ Cplx (-0.795711) (0), Cplx (0.605393) (0),Cplx (-0.0176493) (0) , Cplx (0.00566891) (0)],
                   [ Cplx (-0.592963) (0), Cplx (-0.772421) (0),Cplx (0.21187) (0), Cplx (-0.0828939) (0)],
                   [ Cplx (-0.119282) (0),Cplx (-0.184972) (0), Cplx (-0.777925) (0), Cplx (0.58855) (0)],
                   [Cplx (-0.0317855) (0) , Cplx (-0.0514861) (0), Cplx (-0.591298) (0), Cplx (-0.80418) (0)]]

main :: IO()
main = do
  print "*********************   U (Computational basis -> Energy basis)   *****************************"
  let rotations_trans = rotation_decomposition mytranspose -- apply the rotation decomposition algorithm
  print (map show (rotations_trans)) -- print the resultant decomposition
  disp_error ((matrix_of_elementaries rotations_trans)-mytranspose) -- display the error of decomposing the matrix
