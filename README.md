[![Docker Repository on Quay](https://quay.io/repository/tsombrero/mat-contie/status "Docker Repository on Quay")](https://quay.io/repository/tsombrero/mat-contie)

# mat-contie
Memory Analyzer (MAT) as container

Based on https://github.com/jfrog/auto-mat


# What is mat-contie?
mat-contie is a docker container that allows you to analyse a Java heap dump from the commandline without any GUI involved. You can get html reports directly from the commandline.

# How to run?
All you need is Docker installed on your machine.

cd to the location of your heap dump file, then:
```docker run --mount src=$(pwd),target=/data,type=bind -it quay.io/tsombrero/mat-contie <dump filename> <heap size for mat> <reports>```

dump filename - hprof heap dump file name

heap size for mat - how much memory to consume for this process e.g (11g)

reports - a comma separated list of the following: suspects, overview, top_components. If empty no reports will be generated. You probably want the suspects.


### Example:

```docker run -it --mount src=$(pwd),target=/data,type=bind quay.io/tsombrero/mat-contie heap1.hprof 11g suspects,overview```
```docker run -it --mount src=$(pwd),target=/data,type=bind quay.io/tsombrero/mat-contie my_heap_dump.hprof 48g suspects,overview,top_components```

# What problem does it solve?

Analyzing large heap dumps is a long process which needs a lot of computing resources. Eclipse Memory Analyzer Tool (http://www.eclipse.org/mat/downloads.php) is GUI based tool to analyze heap dumps. It takes a lot of time to run an analysis for the first time with MAT and it consumes a lot of compute power, however when running for the second time it is fast, thats because MAT keeps indexes locally on the running machine.

mat-contie can help with that because it can let you run the analysis on any remote machine that has docker installed. Then you can copy the output to your local machine, run MAT and open the heap dump.
mat-contie will also generate HTML reports which might save you the effort of running MAT.

# How it works?

This is a simple docker wrapper for tools that came from eclipse MAT. Eclipse MAT exposes command line tool to generate indexes and reports.

# Credits

inspiration and run.sh from https://github.com/jfrog/auto-mat

This tool uses:

Ubuntu eclipse-temurin JDK docker image : https://hub.docker.com/_/eclipse-temurin
eclipse mat project https://www.eclipse.org/mat/

