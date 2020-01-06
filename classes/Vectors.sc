Vec2 : VGen {
	*fg { |x = 0.0, y = 0.0|
		^this.multiNew(\fragment, x, y);
	}

	inputDimensions {
		^[[1, 1]];
	}

	outputDimensions {
		^[[2]];
	}
}

Vec3 : VGen {
	*fg { |x = 0.0, y = 0.0, z = 0.0|
		^this.multiNew(\fragment, x, y, z);
	}

	inputDimensions {
		^[[1, 1, 1]];
	}

	outputDimensions {
		^[[3]];
	}
}

Vec4 : VGen {
	*fg { |x = 0.0, y = 0.0, z = 0.0, w = 0.0|
		^this.multiNew(\fragment, x, y, z, w);
	}

	inputDimensions {
		^[[1, 1, 1, 1]];
	}

	outputDimensions {
		^[[4]];
	}
}

VX : VGen {
	*fg { |vec|
		^this.multiNew(\fragment, vec);
	}

	inputDimensions {
		^[[1], [2], [3], [4]];
	}

	outputDimensions {
		^[[1], [1], [1], [1]];
	}
}

VY : VGen {
	*fg { |vec|
		^this.multiNew(\fragment, vec);
	}

	inputDimensions {
		^[[2], [3], [4]];
	}

	outputDimensions {
		^[[1], [1], [1]];
	}
}

VZ : VGen {
	*fg { |vec|
		^this.multiNew(\fragment, vec);
	}

	inputDimensions {
		^[[3], [4]];
	}

	outputDimensions {
		^[[1], [1]];
	}
}


VW : VGen {
	*fg { |vec|
		^this.multiNew(\fragment, vec);
	}

	inputDimensions {
		^[[4]];
	}

	outputDimensions {
		^[[1]];
	}
}

Splat2 : VGen {
	*fg { |x|
		^this.multiNew(\fragment, x);
	}

	inputDimensions {
		^[[1]];
	}

	outputDimensions {
		^[[2]];
	}
}

Splat3 : VGen {
	*fg { |x|
		^this.multiNew(\fragment, x);
	}

	inputDimensions {
		^[[1]];
	}

	outputDimensions {
		^[[3]];
	}
}

Splat4 : VGen {
	*fg { |x|
		^this.multiNew(\fragment, x);
	}

	inputDimensions {
		^[[1]];
	}

	outputDimensions {
		^[[4]];
	}
}


