package br.edu.utfpr.todolist.model.dto;

import lombok.Data;
import lombok.NonNull;

@Data
public class TaskDTO {
    @NonNull
    private Long id;
    @NonNull
    private String taskName;
    @NonNull
    private String description;
    @NonNull
    private String dataCreated;

}
