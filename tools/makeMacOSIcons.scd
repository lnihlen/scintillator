(
fork {
	var server, iconsDir, targetFile, defImage, makeImage;
	var options = ScinServerOptions.new;
	this.executeFile(options.quarkPath +/+ "tools" +/+ "scintillatorLogo.scd");
	defImage = { |vs|
		~logoDefBlue.add(vs);
		~logoDefGreen.add(vs);
		~logoDefRed.add(vs);
	};
	makeImage = { |vs|
		~logoBlue = Scinth.new(\scintillatorLogoBlue, server: vs);
		~logoGreen = Scinth.new(\scintillatorLogoGreen, server: vs);
		~logoRed = Scinth.new(\scintillatorLogoRed, server: vs);
	};

	iconsDir = options.quarkPath +/+ "build" +/+ "AppIcon.iconset";
	File.mkdir(iconsDir);

	options.createWindow = false;
	options.frameRate = 0;
	options.width = 16;
	options.height = 16;
	options.swiftshader = true;
	options.logLevel = 2;
	server = ScinServer.new(options);
	server.bootSync;

	defImage.value(server);
	server.sync;
	makeImage.value(server);
	server.queueScreenShotSync(iconsDir +/+ "icon_16x16.png", "image/png");
	server.advanceFrame(1, 1);
	server.sync;
	server.quit;

	5.wait;

	options.width = 32;
	options.height = 32;
	server = ScinServer.new(options);
	server.bootSync;
	defImage.value(server);
	server.sync;
	makeImage.value(server);
	server.queueScreenShotSync(iconsDir +/+ "icon_16x16@2x.png", "image/png");
	server.queueScreenShotSync(iconsDir +/+ "icon_32x32.png", "image/png");
	server.advanceFrame(1, 1);
	server.sync;
	server.quit;

	5.wait;

	options.width = 64;
	options.height = 64;
	server = ScinServer.new(options);
	server.bootSync;
	defImage.value(server);
	server.sync;
	makeImage.value(server);
	server.queueScreenShotSync(iconsDir +/+ "icon_32x32@2x.png", "image/png");
	server.queueScreenShotSync(iconsDir +/+ "icon_64x64.png", "image/png");
	server.advanceFrame(1, 1);
	server.sync;
	server.quit;

	5.wait;

	options.width = 128;
	options.height = 128;
	server = ScinServer.new(options);
	server.bootSync;
	defImage.value(server);
	server.sync;
	makeImage.value(server);
	server.queueScreenShotSync(iconsDir +/+ "icon_64x64@2x.png", "image/png");
	server.queueScreenShotSync(iconsDir +/+ "icon_128x128.png", "image/png");
	server.advanceFrame(1, 1);
	server.sync;
	server.quit;

	5.wait;

	options.width = 256;
	options.height = 256;
	server = ScinServer.new(options);
	server.bootSync;
	defImage.value(server);
	server.sync;
	makeImage.value(server);
	server.queueScreenShotSync(iconsDir +/+ "icon_128x128@2x.png", "image/png");
	server.queueScreenShotSync(iconsDir +/+ "icon_256x256.png", "image/png");
	server.advanceFrame(1, 1);
	server.sync;
	server.quit;

	5.wait;

	options.width = 512;
	options.height = 512;
	server = ScinServer.new(options);
	server.bootSync;
	defImage.value(server);
	server.sync;
	makeImage.value(server);
	server.queueScreenShotSync(iconsDir +/+ "icon_256x256@2x.png", "image/png");
	server.queueScreenShotSync(iconsDir +/+ "icon_512x512.png", "image/png");
	server.advanceFrame(1, 1);
	server.sync;
	server.quit;

	5.wait;

	options.width = 1024;
	options.height = 1024;
	server = ScinServer.new(options);
	server.bootSync;
	defImage.value(server);
	server.sync;
	makeImage.value(server);
	server.queueScreenShotSync(iconsDir +/+ "icon_512x512@2x.png", "image/png");
	server.advanceFrame(1, 1);
	server.sync;
	server.quit;

	5.wait;

	("iconutil -c icns" + iconsDir).systemCmd;
	targetFile = options.quarkPath +/+ "src" +/+ "macos" +/+ "Resources" +/+ "AppIcon.icns";
	if (File.exists(targetFile), {
		File.delete(targetFile);
	});
	File.copy(options.quarkPath +/+ "build" +/+ "AppIcon.icns", targetFile);
}
)