process ConvertTiff {
    container 'hwarden162/scema:latest'
    withDocker { 
        runOptions = '-v ${projectDir}/src:/src'
    }
    memory "8 GB"
    time "1 h"
    cpus 1

    input:
        val image_name
        path image
    
    output:
        val image_name
        path zarr_path

    script:
        """
        python /src/process_convert_tiff.py \
            --tiff-path ${image} \
            --zarr-out ${image_name}_zarr.zarr \
            --json-out ${image_name}_meta.json
        """
}