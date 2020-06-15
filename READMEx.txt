

Empirically determining optimal read length cutoff for re-sequencing projects

ASSUMPTION
The idea is that the shorter reads probably have more (mapping) errors and therefore contribute more *apparent* SNPs. We want to find, empirically for each data set, the read length at which this effect tapers off, and to use it as a read length cutoff. 

APPROACH
I use a series of simple perl scripts and linux system utilities: I extract for each entry of a .sam file the NM tag (edit distance: SNPs and indels) and the read length. For each possible length (between about 20 and 40bp or so) I then collect the same total number of bases. Finally, I output how many variants I have for each read length. As a cutoff we use the read length at which we start to see a relatively constant number of variants for the bases collected. These analyses are currently done in four steps and require two different perl scripts, see below. 

INPUT
Required input is a sam file that is the result of these steps:
- trim and merge reads with a minimum length filter of 10bp 
- collapse duplicates using samtools rmdup 
- use bwa-aln & samtools for mapping of reads, with read groups (as needed for GATK variant calling), -q 30 mapping filter 



ANALYSIS STEPS

1. make an inventory of how many SNPs/indels (NM tag in SAM file!) there are for each read, also keep read length: 
perl 01_computeStats.pl  /path/to/input.sam   output.txt
 output: a. on the terminal: information about how many mapped reads don't have an NM tag. This number should be zero! 
         b. the file output.txt

2. shuffle the order of the lines in the file. Because we didn't know if the original file is sorted based on quality: 
perl -MList::Util -e 'print List::Util::shuffle <>'    output.txt      >    output_shuffled.txt   
 output: the file output_shuffled.txt

3. compare read length bins for the full data set
perl 02_compareBinsLT30.pl  output_shuffled.txt   20000000000
 output: a table that lists for each read length bin the total amount of data (nt), and the SNPs/indels for this data

    EXAMPLE OUTPUT 
    
    key	lengths	variants 
    rl10	0	0 
    rl11	0	0 
    rl12	0	0 
    rl13	0	0 
    rl14	0	0 
    rl15	195	10 
    rl16	208	0 
    rl17	1156	2 
    rl18	2610	61 
    rl19	14573	1108 
    rl20	59340	5048 
    rl21	102606	8490 
    rl22	115610	8928 
    rl23	88734	5975 
    rl24	55752	2883 
    rl25	42050	1310 
    rl26	34996	606 
    rl27	35073	288 
    rl28	35980	210 
    rl29	42224	207 
    rl30	43590	190 
    rl31	48422	195 
    rl32	50272	213 
    rl33	53856	239 
    rl34	58378	269 
    rl35	59255	217 
    rl40	67800	331 
    rl45	71955	329 
    rl50	67650	269 
    rl55	57805	237 
    rl60	54000	218

    ---> so this tells me, for example, that all reads of length 23 (rl23) make up a total length of 88,734 bp and collectively contain 5,975 variants. Based on this information, I select a number of bp from the second column for the next step (see below) such that for the entire range of read lengths I'm interested in, I'm able to collect the same total length of sequence data. I could use 35,000 here, for example. Selecting 40,000 is a bad idea since I don't have that much data for some of the read lengths (e.g., rl26-28). 


4. compare read length bins for a reasonable total length per read length bin. This requires looking at the data and setting the total length yourself, see explanation above. 
perl 02_compareBinsLT30.pl  output_shuffled.txt   xxxxx
 output: same table as above, but normalized for a given total data volume xxxxx

    EXAMPLE OUTPUT with xxxxx = 25000

    key	lengths	variants 
    rl10	0	0   
    rl11	0	0   
    rl12	0	0   
    rl13	0	0   
    rl14	0	0   
    rl15	195	10  
    rl16	208	0   
    rl17	1156	2   
    rl18	2610	61  
    rl19	14573	1108
    rl20	25000	2165
    rl21	25011	2090
    rl22	25014	1901
    rl23	25001	1677
    rl24	25008	1277
    rl25	25000	758 
    rl26	25012	411 
    rl27	25002	215 
    rl28	25004	142 
    rl29	25027	124 
    rl30	25020	109 
    rl31	25017	106 
    rl32	25024	103 
    rl33	25014	115 
    rl34	25024	109 
    rl35	25025	111 
    rl40	25000	118 
    rl45	25020	102 
    rl50	25000	110 
    rl55	25025	110 
    rl60	25020	91  

    ---> now I can compare total number of variants for each read length for which I have collected xxxxx = 25000bp. For reads of lengths 20-24 there are lots more variants, then it drops at rl25 and rl26, and by rl28 things start to taper off. If pressed for data, I could use a cutoff of 28bp, otherwise 29 or 30 might be safer.  


5. Sincere apologies 
These scripts are ugly! The whole thing started out as a quick-and-dirty way to look at some of our own people's data, and I never got around to prettify the approach. 



