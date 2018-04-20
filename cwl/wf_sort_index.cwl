#!/usr/bin/env cwltool

### This is kind of a worthless workflow, ###
### but to keep consistent with the paired-end ###
### pipeline, I'm keeping it here. ###

cwlVersion: v1.0
class: Workflow

requirements:
  - class: StepInputExpressionRequirement
  - class: SubworkflowFeatureRequirement
  - class: ScatterFeatureRequirement      # TODO needed?
  - class: MultipleInputFeatureRequirement


#hints:
#  - class: ex:ScriptRequirement
#    scriptlines:
#      - "#!/bin/bash"


inputs:

  bam_file:
    type: File

outputs:

  sorted_bam_file:
    type: File
    outputSource: index/alignments_with_index

steps:

###########################################################################
# sort step
###########################################################################
  sort:
    run: sort.cwl
    in:
      input_sort_bam: bam_file
    out: [
      output_sort_bam
    ]

  index:
    run: samtools-index.cwl
    in:
      alignments: sort/output_sort_bam
    out: [
      alignments_with_index
    ]
###########################################################################
# index step
###########################################################################

doc: |
  This workflow sorts and indexes