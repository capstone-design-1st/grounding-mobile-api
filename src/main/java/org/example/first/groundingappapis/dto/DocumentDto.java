package org.example.first.groundingappapis.dto;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.UUID;

@Data
@NoArgsConstructor
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class DocumentDto {
    private UUID id;
    private String title;
    private String s3Url;
    private String cloudfrontUrl;

    @Builder
    public DocumentDto(
            UUID id,
            String title,
            String s3Url,
            String cloudfrontUrl) {
        this.id = id;
        this.title = title != null ? title : "";
        this.s3Url = s3Url != null ? s3Url : "";
        this.cloudfrontUrl = cloudfrontUrl != null ? cloudfrontUrl : "";
    }
}
