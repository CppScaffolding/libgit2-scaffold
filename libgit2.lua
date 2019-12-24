-- scaffold geniefile for libgit2

libgit2_script = path.getabsolute(path.getdirectory(_SCRIPT))
libgit2_root = path.join(libgit2_script, "libgit2")

libgit2_includedirs = {
	path.join(libgit2_script, "config"),
	libgit2_root,
}

libgit2_libdirs = {}
libgit2_links = {}
libgit2_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { libgit2_includedirs }
	end,

	_add_defines = function()
		defines { libgit2_defines }
	end,

	_add_libdirs = function()
		libdirs { libgit2_libdirs }
	end,

	_add_external_links = function()
		links { libgit2_links }
	end,

	_add_self_links = function()
		links { "libgit2" }
	end,

	_create_projects = function()

project "libgit2"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		libgit2_includedirs,
	}

	defines {}

	files {
		path.join(libgit2_script, "config", "**.h"),
		path.join(libgit2_root, "**.h"),
		path.join(libgit2_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
