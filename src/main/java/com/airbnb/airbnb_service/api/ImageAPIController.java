package com.airbnb.airbnb_service.api;

import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/api/images")
public class ImageAPIController {
    @Value("${spring.servlet.multipart.location}") String path;
    @GetMapping("/get/{type}/{filename}")
    public ResponseEntity<Resource> getImage(
        @PathVariable String type,
        @PathVariable String filename,
        HttpServletRequest request
    ) {
        Path folderLocation = Paths.get(path+"/"+type);
        Path filePath = folderLocation.resolve(filename);
        
        Resource r = null;
        try {
            r = new UrlResource(filePath.toUri());
        }
        catch(Exception e) {
            System.out.println("파일을 찾을 수 없거나, 잘못된 파일 경로입니다.");
        }
        
        // 파일의 실제 경로에 찾아가서 파일의 유형을 가져온다.
        String contentType = null;
        try {
            request.getServletContext().getMimeType(r.getFile().getAbsolutePath());
            if(contentType == null)
                contentType = "application/octet-stream";
        }
        catch(Exception e) {
            System.out.println("파일을 찾을 수 없거나, 잘못된 파일 경로입니다.");
        }
        
        return 
            ResponseEntity.ok() // 결과로 200 OK를 설정
            // 파일의 타입을 Spring프레임 워크를 통해 파일 유형을 결정
            .contentType(MediaType.parseMediaType(contentType)) 
            // 파일 이름의 표시 방법을 설정 (다운로드 되는 파일의 이름 설정)
            .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename*=\""+r.getFilename()+"\"")
            // 실제 리소스를 Body에 포함
            .body(r);
    }
}