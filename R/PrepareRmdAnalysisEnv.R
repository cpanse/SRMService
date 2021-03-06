#R
# by WEW
# this are some function to copy RMD files and preprare envs.
.scriptCopyHelperVec <- function(runscripts, workdir = getwd() ){
  for(scripts in runscripts){
    src_script <- file.path( find.package("SRMService") , scripts )

    dest_script <- file.path(workdir ,basename(scripts))
    message("copy ", src_script, " to ", dest_script)

    if(!file.copy(src_script , dest_script)){
      warning(paste("could not copy script file. Does file already exist?", dest_script, sep=" "))
    }
  }
  message(paste("your working directory now should contain ", length(runscripts) , "new files :\n",sep=" "))
  res <- NULL
  for(script in runscripts){
    message( basename(script) )
    res <- c(res, basename(script) )
  }
}
#' copies the RMD and Run files for 2 grp analysis based on MQ (MaxQuant) in your working directory
#' - ideally the txt directory of your MQ session.
#'
#' Please see the Run_QuantTwoGroupAnalysis.R for more details
#'
#' @export
#' @examples
#'
#' \dontrun{
#' SRMService::RMD_MQ_Quant_2GrpAnalysis()
#' }
#' @param workdir specify working directory
#'
RMD_MQ_Quant_2GrpAnalysis <- function(workdir = getwd()){
  .scriptCopyHelperVec(c("/RunScripts/Run_MQ_QuantTwoGroupAnalysis.R",
                         "/doc/Grp2Analysis.Rmd",
                         "/doc/bibliography.bib",
                         "/doc/Grp2Analysis_MissingInOneCondition.Rmd",
                         "/doc/Empty.Rmd"), workdir = workdir )
}

#' copies the RMD and Run files for 2 grp analysis based on a PD (protein discoverer) in your working directory.
#'
#' Please see the Run_QuantTwoGroupAnalysis.R for more details
#'
#' @export
#' @examples
#' \dontrun{
#' SRMService::RMD_PD_Quant_2GrpAnalysis()
#' }
#' @param workdir specify working directory
#'
RMD_PD_Quant_2GrpAnalysis <- function(workdir= getwd()){
  .scriptCopyHelperVec(c("/RunScripts/Run_PD_QuantTwoGroupAnalysis.R",
                         "/doc/Grp2Analysis.Rmd",
                         "/doc/bibliography.bib",
                         "/doc/Grp2Analysis_Empty.Rmd_t",
                         "/doc/Grp2Analysis_MissingInOneCondtion.Rmd_t"), workdir = workdir )
}
#' copies the RMD and Run files for the QuantQCReport in your working directory.
#'
#' Please see the Run_QuantQCReport.R for more details
#'
#' @param workdir specify working directory
#' @export
#' @examples
#' \dontrun{
#' SRMService::RMD_MQ_Quant_QCReport()
#' }
RMD_MQ_Quant_QCReport <- function(workdir = getwd()){
  .scriptCopyHelperVec(c("/RunScripts/Run_QuantQCReport.R","/reports/QCReport.Rmd"), workdir = workdir )
}

#' Copies the RMD and Run files for variable selection into your working directory.
#'
#' Please see the Run_QuantTwoGroupAnalysis.R for more details
#'
#' @export
#'
#' @param workdir specify working directory
#'
RMD_VarSelection <- function(workdir = getwd()){
  .scriptCopyHelperVec(c("/RunScripts/RUN_VarSelection_Multinomial.R",
                         "/reports/VariableSelection_MultinomialLasso.Rmd",
                         "/RunScripts/RUN_VarSelection_GLM.R",
                         "/reports/VariableSelection_ROCSingleProtein.Rmd",
                         "/reports/VariableSelection_GLM.Rmd"
  ), workdir =workdir )
}

#' Copies the RMD and Run R file for Library generation your working directory.
#'
#' Please see the Run_specLProzor.R file in the working directory
#' for more details
#'
#' @export
#' @param workdir specify working directory
#'
RMD_LibraryGen_specLProzor <- function(workdir = getwd()){
  .scriptCopyHelperVec(c("/RunScripts/Run_specLWithProzor.R","/reports/specLWithProzor.Rmd"), workdir = workdir )
}

#' Copies the Rnw file and Run R file for old 1To1 QC into your working directory.
#'
#' Please see the Run_1To1_oldStyle.R file in your working directory,
#' for more details
#'
#' @export
#' @param workdir specify working directory
#'
RMD_QC1To1_Old <- function(workdir = getwd(), minimal = TRUE){
  if(!minimal){
    .scriptCopyHelperVec(c("/OneToOneAnalysis/Run_1To1_oldStyle.R",
                           "/OneToOneAnalysis/fgcz_MQ_QC_report.Rnw",
                           "/OneToOneAnalysis/images/LFQ_QC_workflow.pdf",
                           "/OneToOneAnalysis/images/Sweave.sty"), workdir = workdir)
  }else{
    .scriptCopyHelperVec(c("/OneToOneAnalysis/fgcz_MQ_QC_report.Rnw",
                           "/OneToOneAnalysis/images/LFQ_QC_workflow.pdf",
                           "/OneToOneAnalysis/images/Sweave.sty"), workdir = workdir)

  }
}

.RMD_QC1To1_Old <- function(workdir = getwd(), minimal = TRUE){
  if(!minimal){
    .scriptCopyHelperVec(c("/OneToOneAnalysis/Run_1To1_oldStyle.R",
                           "/OneToOneAnalysis/MQ_sampleQC_overview.Rnw",
                           "/OneToOneAnalysis/images/LFQ_QC_workflow.pdf",
                           "/OneToOneAnalysis/images/Sweave.sty"), workdir = workdir)
  }else{
    .scriptCopyHelperVec(c("/OneToOneAnalysis/MQ_sampleQC_overview.Rnw",
                           "/OneToOneAnalysis/images/LFQ_QC_workflow.pdf",
                           "/OneToOneAnalysis/images/Sweave.sty"), workdir = workdir)

  }
}

#' Copies the Rnw file and Run R file for the SRM QC and normalization.
#'
#' Please see the Run_1To1_oldStyle.R file in your working directory,
#' for more details
#'
#' @export
#' @param workdir specify working directory
#'
RMD_SRM_QC_Normalization <- function(workdir = getwd()){
  .scriptCopyHelperVec(c("/reports/SRM_NormalizeByProteins.Rmd",
                         "/reports/SRM_PeptideProteinQC.Rmd",
                         "/RunScripts/RUN_SRMPeptideProteinQC.R"), workdir = workdir)
}

