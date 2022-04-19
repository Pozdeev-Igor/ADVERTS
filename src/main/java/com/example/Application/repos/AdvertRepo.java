package com.example.Application.repos;

import com.example.Application.entity.Advert;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AdvertRepo extends CrudRepository<Advert, Long> {

    List<Advert> findByTitle(String title);

}
