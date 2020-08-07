:- consult("UnityLogic/KBs/UnityLogicAgentAPI.prolog").

desire checkBoxes.

add checkBoxes && (\+ belief has_box) => [
    act (getArea("Pickup"), Area),
    cr goto(Area),
    act (senseArtifact, Artifact),
    add_desire(pickup(Artifact)),
    stop
].

add pickup(Artifact) && (\+ belief has_box) => [
    cr goto(Artifact),
    act pickup(Artifact),
    add_belief(has_box),
    add_desire(drop(Artifact)),
    stop
].

add drop(Artifact) && (belief has_box) => [
    check_artifact_belief(Artifact, storage_area_A),
    act (getArea("A"), Area),
    cr goto(Area),
    act dropdown,
    del_belief(has_box),
    add_desire(checkBoxes),
    stop
].

add drop(Artifact) && (belief has_box) => [
    check_artifact_belief(Artifact, storage_area_B),
    act (getArea("B"), Area),
    cr goto(Area),
    act dropdown,
    del_belief(has_box),
    add_desire(checkBoxes),
    stop
].

add drop(Artifact) && (belief has_box) => [
    check_artifact_belief(Artifact, storage_area_C),
    act (getArea("C"), Area),
    cr goto(Area),
    act dropdown,
    del_belief(has_box),
    add_desire(checkBoxes),
    stop
].

add drop(Artifact) && (belief has_box) => [
    check_artifact_belief(Artifact, storage_area_D),
    act (getArea("D"), Area),
    cr goto(Area),
    act dropdown,
    del_belief(has_box),
    add_desire(checkBoxes),
    stop
].