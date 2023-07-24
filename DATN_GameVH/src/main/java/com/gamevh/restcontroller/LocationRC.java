package com.gamevh.restcontroller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gamevh.dto.LocationDTO;
import com.gamevh.entities.Location;
import com.gamevh.mapper.LocationMapper;
import com.gamevh.service.LocationService;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/location")
public class LocationRC {
	@Autowired
	LocationService locationService;
	
	@Autowired
	LocationMapper locationMapper;
	
	@GetMapping("username/{username}")
	public ResponseEntity<List<LocationDTO>> getAccountLogin(@PathVariable("username") Optional<String> username) {
		Optional<String> optionalUsername = username;

		if (optionalUsername.isPresent() && !optionalUsername.get().trim().equals("")) {
			List<Location> listLocation = locationService.findByAccountUsername(optionalUsername.get());
			if (!listLocation.isEmpty()) {
				List<LocationDTO> listLocationDTO = new ArrayList<>();
				for (Location location : listLocation) {
					listLocationDTO.add(locationMapper.modelToDto(location));
				}
				
				return ResponseEntity.ok(listLocationDTO);
			}
		}

		return null;
	}
}
