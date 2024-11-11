#!/usr/bin/env nextflow
nextflow.enable.dsl = 2

include { ConvertTiff } from './modules/process_convert_tiff.nf'

file_list = Channel.fromPath(
    "${params.input_folder}/*${params.file_extension}"
).multiMap{ image ->
    image_name: image.baseName
    image: image
}


workflow {
    ConvertTiff(file_list)
    convert_tiff_out = ConvertTiff.out

    
}