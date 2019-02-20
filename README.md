# OpenCTF - component test framework

The OpenCTF component test framework helps to build automatic tests for all (visual and non-visual) VCL components in a Delphi application. It is based on the DUnit framework.

Compiled and tested with Delphi 2009.

# API documentation (generated with doxygen and pas2dox) #

https://michaeljustin.github.io/openctf/

# Building docs and distribution binaries # 

OpenCTF can be used without running the build script.

The build scripts are only neccessary for OpenCTF developers.

They may be used to compile and run the example test projects
and to build the distribution package.

## Required tools ##

- to run the build script, Apache Ant 1.7 or newer is required
- doxygen and pas2dox are required to build the documentation (copy pas2dox.exe to the "make" folder)
- to run the tests, DUnit 9.4 is required

Apache Ant: 
https://ant.apache.org

Doxygen:
http://www.doxygen.nl

pas2dox 0.41:
https://sourceforge.net/projects/pas2dox/
