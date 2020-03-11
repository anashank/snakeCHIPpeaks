# snakeCHIPpeaks
Snakemake pipeline for obtaining enrichment quality measures using phantompeakqualtools and peak calling using MACS2. 

# Before running
In the `config.yaml` file you should include details of samples to be analyzed and paths. You can also specify custom options for MACS2.
Sorted BAM files should be placed in same folder before running snakemake.

### Dependiencies
* [snakemake](https://snakemake.readthedocs.io/en/stable/)
* R > 3.3.0
* [samtools](http://www.htslib.org/)
* [phantompeakqualtools](https://github.com/kundajelab/phantompeakqualtools)
* [macs2](https://github.com/taoliu/MACS) for calling peaks
