#include "compressor.h"
#include <hls_stream.h>
#include <iostream>

using namespace std;

int main() {
	float x;
	hls::stream<float> in("input");
	hls::stream<float> out("output");

	for (x = -1.3f; x <= 1.3f; x += 0.01f) {
		in << x;
		compressor(in, out, 0.7f, 0.5f);
		float tmp;
		out >> tmp;
		cout << tmp << "\t";
	}

	cout << endl;
}
