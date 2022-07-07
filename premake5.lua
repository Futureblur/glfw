project "glfw"
	kind "SharedLib"
	language "C"
	objdir "%{BuildPath}"

	files
	{
		"include/GLFW/glfw3.h",
		"include/GLFW/glfw3native.h",
		"src/internal.h",
		"src/platform.h",
		"src/mappings.h",
		"src/context.c",
		"src/init.c",
		"src/input.c",
		"src/monitor.c",
		"src/platform.c",
		"src/vulkan.c",
		"src/window.c",
		"src/egl_context.c",
		"src/osmesa_context.c",
		"src/null_platform.h",
		"src/null_joystick.h",
		"src/null_init.c",
		"src/null_monitor.c",
		"src/null_window.c",
		"src/null_joystick.c"
	}

	filter "system:macosx"
		files
		{
			"src/cocoa_time.h",
			"src/cocoa_time.c",
			"src/posix_thread.h",
			"src/posix_module.c",
			"src/posix_thread.c",

			"src/cocoa_platform.h",
			"src/cocoa_joystick.h",
			"src/cocoa_init.m",
			"src/cocoa_joystick.m",
			"src/cocoa_monitor.m",
			"src/cocoa_window.m",
			"src/nsgl_context.m"
		}

		defines "_GLFW_COCOA"

		links
		{
			"Cocoa.framework",
			"IOKit.framework",
			"OpenGL.framework",
			"CoreVideo.framework"
		}

	filter "system:windows"
		files
		{
			"win32_time.h",
			"win32_thread.h",
			"win32_module.c",
			"win32_time.c",
			"win32_thread.c",

			"win32_platform.h",
			"win32_joystick.h",
			"win32_init.c",
			"win32_joystick.c",
			"win32_monitor.c",
			"win32_window.c",
			"wgl_contect.c"
		}

		defines "_GLFW_WIN32"

		systemversion "latest"
		staticruntime "on"

	filter "system:linux"
		files
		{
			"src/x11_platform.h",
			"src/x11_init.c",
			"src/x11_monitor.c",
			"src/x11_window.c",
			
			"src/xkb_unicode.h",
			"src/xkb_unicode.c",
			
			"src/glx_context.c",
			"src/egl_context.c",
			"src/osmesa_context.c",
			
			"src/linux_joystick.c",
			"src/linux_joystick.h",
			
			"src/posix_time.c",
			"src/posix_thread.c",
			"src/posix_module.c",
			"src/posix_time.h",
			"src/posix_thread.h",
			"src/posix_poll.c",
			"src/posix_poll.h"
		}

		defines "_GLFW_X11"

		pic "on"