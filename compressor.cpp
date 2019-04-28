#include "compressor.h"
#include <hls_stream.h>

using namespace hls;

void compressor(
		stream<float> &in,
		stream<float> &out,
		float thresh,
		float slope
) {
#pragma HLS INTERFACE ap_ctrl_none port=return
#pragma HLS INTERFACE s_axilite port=slope bundle=CTRL_BUS
#pragma HLS INTERFACE s_axilite port=thresh bundle=CTRL_BUS
#pragma HLS INTERFACE axis register both port=out
#pragma HLS INTERFACE axis register both port=in
	float tmp;
	in >> tmp;

	if (tmp > thresh) {
		tmp = thresh + (tmp-thresh)*slope;
	} else if (-tmp > thresh) {
		tmp  = -thresh + (thresh + tmp)*slope;
	}

	out << tmp;

}
