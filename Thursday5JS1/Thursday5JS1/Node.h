#pragma once
#include <cstdarg>
//#include <cstdio>

class Node
{
public:
	virtual void dump(int indent) = 0;
	void indent(int N)
	{
		for (int i = 0; i < N; i++)
			printf("    ");
	}
	void label(int i, const char* fmt, ...)
	{
		indent(i);
		va_list args;
		va_start(args, fmt);
		vprintf(fmt, args);
		va_end(args);
	}
	void dump(int i, const char* name)
	{
		label(i, "%s:\n", name);
		dump(i + 1);
	}
};