# this are some function to copy RMD files and preprare envs.

.scriptCopyHelper <- function(runscript, rmfile ){
  workdir <- getwd()
  src_rmdfile <- file.path( path.package("SRMService") , rmfile )
  src_runscript <- file.path(path.package("SRMService"), runscript)

  dest_rmdfile <- file.path(workdir ,basename(src_rmdfile))
  dest_runscript <- file.path(workdir, basename(src_runscript))

  if(!file.copy(src_rmdfile , dest_rmdfile)){
    stopApp(7)
  }else if(!file.copy(src_runscript,dest_runscript )){
    stopApp(7)
  }

  message("your working directory now should contain 2 files :",
          basename(src_rmdfile),
          " and ",
          basename(src_runscript),"\n" )
}

#' copies the RMD and Run files for 2 grp analysis in your working directory.
#' Please see the Run_QuantTwoGroupAnalysis.R for more details
#' @export
#' @examples
#' SRMService::RMD2GrpAnalysis()
#'
RMD_Quant_2GrpAnalysis <- function(){
  .scriptCopyHelper("/samples/Run_QuantTwoGroupAnalysis.R","/reports/Grp2Analysis.Rmd" )
}

#' copies the RMD and Run files for 2 grp analysis in your working directory.
#' Please see the Run_QuantTwoGroupAnalysis.R for more details
#' @export
#' @examples
#' SRMService::RMD_QC_QuantReport()
#'
RMD_Quant_QCReport <- function(){
  .scriptCopyHelper("/samples/Run_QuantQCReport.R","/reports/QCReport.Rmd" )
}