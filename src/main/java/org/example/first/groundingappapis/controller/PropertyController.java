package org.example.first.groundingappapis.controller;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.example.first.groundingappapis.dto.PropertyDto;
import org.example.first.groundingappapis.entity.User;
import org.example.first.groundingappapis.security.UserPrincipal;
import org.example.first.groundingappapis.service.LikeService;
import org.example.first.groundingappapis.service.PropertyService;
import org.example.first.groundingappapis.vo.SortType;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@Slf4j
@RequestMapping("/properties")
@RestController
@RequiredArgsConstructor
public class PropertyController {

    private final PropertyService propertyService;
    private final LikeService likeService;

    //매물 상세
    @PreAuthorize("isAuthenticated()")
    @GetMapping("/{propertyId}")
    public ResponseEntity<PropertyDto.GetResponse> getProperty(@PathVariable String propertyId) {
        log.info("getProperty called with propertyId: {}", propertyId);

        return ResponseEntity.ok(propertyService.getProperty(propertyId));
    }

    @PreAuthorize("isAuthenticated()")
    @GetMapping("/{proepertyId}/like")
    public ResponseEntity<PropertyDto.GetLikesResponse> isUserlikeProperty(@AuthenticationPrincipal UserPrincipal userPrincipal, @PathVariable String propertyId) {
        log.info("likeProperty called with propertyId: {}", propertyId);

        final User user = userPrincipal.getUser();

        return ResponseEntity.ok(likeService.isUserLikeProperty(UUID.fromString(propertyId), user));
    }

    //거래량이 많은 매물 페이지
    @PreAuthorize("isAuthenticated()")
    @GetMapping("/popular")
    public ResponseEntity<Page<PropertyDto.ReadBasicInfoResponse>> getPopularProperties(@RequestParam(defaultValue = "0") int page,
                                                                             @RequestParam(defaultValue = "10") int size) {
        log.info("getPopularProperties called with page: {}, size: {}", page, size);

        final SortType sortType = SortType.VOLUMES;
        final Sort sortBy = Sort.by(Sort.Direction.DESC, SortType.getSortField(sortType));

        Pageable pageable = PageRequest.of(page, size, sortBy);

        return ResponseEntity.ok(propertyService.getPopularProperties(pageable));
    }


    //거래 중인 건물 및 토지 검색 페이지


}
