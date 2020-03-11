
configfile: "config.yaml"


rule all:
    input:
        expand("{sample}_macs2", sample=config["samples"])

#Filter multi-mapped reads and obtain quality measures using phantompeakqualtools

rule filter_multimapped_qc:
    input:
        "{sample}.sorted.bam"
    output:
        o1 = "filtered_{sample}.bam",
        o2 = "phantompeakqual_{sample}/{sample}.txt"
    params:
        p1 = "{sample}"
    log:
    	qualtools = "log/{sample}.qual"

    shell:
	    "samtools view -h {input} | grep -v -e 'XA:Z:' -e 'SA:Z:' | samtools view -b > {output.o1} && Rscript ./phantompeakqualtools/run_spp.R -c={output.o1} -savp -p=8 -odir=phantompeakqual_{params.p1} -out={output.o2} -tmpdir=phantompeakqual_{params.p1} 2> {log.qualtools}"

#Call peaks using MACS2
rule macs2:
    input:
        "filtered_{sample}.bam"
    output:
        o2 = directory("{sample}_macs2")
    params:
    	p1 = "{sample}"
    log:
    	macs2 = "log/{sample}.macs"
    shell:
        "macs2 callpeak {config[treatment]} {input} {config[control]} -n {params.p1} {config[macs_optional]} --outdir {output.o2} {config[broad_peak]};"
