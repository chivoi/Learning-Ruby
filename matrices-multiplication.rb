require 'matrix'

# takes in matrices as arrays and returns the product of two as an array

def multiply_matrix(m1, m2)    
  matrix1 = make_matrix(m1)
  matrix2 = make_matrix(m2)
  if matrix1.column_count == matrix2.row_count
    result = (matrix1 * matrix2).to_a
    return result
  else 
    return "Can't multiply, dimentions not equal."
  end
end

# helper to convert input to matrices
def make_matrix(x)
  if x[0].is_a?(Array)
    x = Matrix[*x]
  else
    x = Matrix[x]
  end
end