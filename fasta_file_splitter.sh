#! /bin/sh
# highly commented fasta splitter for frank
# this shell script will split large, uncompressed fasta/fastq files into ~4GB files
# to use, place this file in the folder with the files to be split
# open terminal and "cd" to directory (can do this by dragging folder into the terminal)
# type "bash fasta_file_splitter.sh" and click enter/return


# this loops through all files that have a .fasta/.fastq extension
# other file types and compressed fasta/q files need different processing the file 
#    into ~4GB chunks, with the remainder in the final file
for file in *.fast* 
do
# the "split" function does the actual splitting in the form:
#    split [-l (# of lines)] [input file][output file_prefix]
# here the -l flag tells the program to split the input file into files of 59588896 lines
#    use any number you want, just make sure it is divisible by 4 (for fastq)
# "$file" refers to the file currently in the for loop & "split_$file." refers to the
#    output prefix. The function will append sequential letters to the end of the filenames.
  split -l 59588896 "$file" "split_$file."
done

#the following two loops append the correct file extension to the newly created files
for file in *.fasta.a*
do
  mv "$file" "$file.fasta"
done

for file in *.fastq.a*
do
  mv "$file" "$file.fastq"
done