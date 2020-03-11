# snakeCHIPpeaks
Snakemake pipeline for obtaining quality measures using phantompeakqualtools and peak calling using MACS2. 
Sorted BAM files should be placed in same folder before running snakemake.

### Dependiencies
* [snakemake](https://snakemake.readthedocs.io/en/stable/). snakemake is python3
* R > 3.3.0
* [samtools](http://www.htslib.org/)
* [phantompeakqualtools](https://github.com/kundajelab/phantompeakqualtools)
* [macs2](https://github.com/taoliu/MACS) for calling peaks
