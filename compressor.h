#ifndef COMPRESSOR_H
#define COMPRESSOR_H 1

#include <hls_stream.h>

void compressor(
		hls::stream<float> &in,
		hls::stream<float> &out,
		float thresh,
		float slope
);

#endif
