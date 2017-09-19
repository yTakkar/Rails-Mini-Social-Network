import $ from 'jquery'

// SCROLL TO TOP
$('.page_end').on('click', () => {
  $('html, body').animate({ scrollTop: 0 }, 450)
})

// FLASH MESSAGE CLOSE
$('.flash_icon').on('click', () => {
  $('.flash').animate({ top: '105%' })
})
