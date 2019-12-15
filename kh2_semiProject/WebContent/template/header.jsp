<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Document</title>
    <link rel="stylesheet" href="css/header-style.css" />
    <link rel="stylesheet" href="css/index-style.css" />
    <link rel="stylesheet" href="css/hover-min.css" />
  </head>
  <body>
    <header id="header">
        <!-- ��ܹ� ���� -->
      <div class="top-bar">
        <div class="top-bar__logo">
          <a class="logo-imageBox" href="">
            <img class="logo-image" src="http://placehold.it/60x60"
          /></a>
        </div>
        <div class="top-bar__menu">
          <ul>
            <li><a class="top-bar__menu-item" href="">��������</a></li>
            <li><a class="top-bar__menu-item" href="">����</a></li>
            <li><a class="top-bar__menu-item" href="">�α���/�α׾ƿ�</a></li>
            <li><a class="top-bar__menu-item" href="">ȸ������</a></li>
          </ul>
        </div>
      </div>
      <!-- ��ܹ� �� -->
      <section class="search">
          <div class="search__empty"></div>
          <div class="search-inputArea">
            <label for="inp" class="inp">
              <input id="inp" class="search__location" type="text" placeholder="&nbsp;">
              <span class="label">������</span>
              <span class="border"></span>
            </label>
          </div>
          <!-- <input class="search-btn" type="submit" value="�˻�"> -->
      </section>
    </header>
