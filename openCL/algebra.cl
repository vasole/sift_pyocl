/**
 * \brief Linear combination of two matrices
 *
 * @param u: Pointer to global memory with the input data of the first matrix
 * @param a: float scalar which multiplies the first matrix
 * @param v: Pointer to global memory with the input data of the second matrix
 * @param b: float scalar which multiplies the second matrix
 * @param w: Pointer to global memory with the output data
 * @param width: integer, number of columns the matrices
 * @param height: integer, number of lines of the matrices
 *
 */
 
#define MAX_CONST_SIZE 16384

/*
TODO:
-check if u and v are indeed in constant memory

*/

__kernel void combine(
	__constant float *u __attribute__((max_constant_size(MAX_CONST_SIZE))),
	float a,
	__constant float *v __attribute__((max_constant_size(MAX_CONST_SIZE))),
	float b,
	__global float *w,
	int width,
	int height)
{
	
	int gid1 = (int) get_global_id(1);
	int gid0 = (int) get_global_id(0);

	if (gid0 < height && gid1 < width) {
	
		int index = gid0 * width + gid1;
		w[index] = a * u[index] + b * v[index];
	}
}
