source do_get_project_settings.cmd
source ../../../tsbs/common_scripts_library/tsb/ip/scripts/get_relative_path.sh
cd ../exe
exe_dir=$(pwd)
cd -
cd ${quartus_project_location_directory}/
project_dir=$(pwd)
relative_path=$(get_relative_path ${project_dir} ${exe_dir})
quartus_cpf -c ${relative_path}/${cof_filename_for_programming_aux_fpga_flash}.cof
cd -
source convert_pof_to_rbf.cmd ../exe/${pof_filename_for_programming_aux_fpga_flash}