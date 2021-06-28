module gthread.c.functions;

import std.stdio;
import gthread.c.types;
import linker.loader;

version (Windows)
	static immutable LIBRARY_GTHREAD = [];
else version (OSX)
	static immutable LIBRARY_GTHREAD = [];
else
	static immutable LIBRARY_GTHREAD = [""];

shared static this()
{}

__gshared extern(C)
{
}

