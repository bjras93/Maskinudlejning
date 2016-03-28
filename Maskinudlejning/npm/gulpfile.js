var gulp = require('gulp');
var sass = require('gulp-sass');
 var concat = require('gulp-concat');
 
gulp.task('sass', function () {
  return gulp.src('../Maskinudlejning/Content/scss/main.scss')
    .pipe(sass().on('error', sass.logError))
    .pipe(gulp.dest('../Maskinudlejning/Content/css'));
});
 
gulp.task('scripts', function() {
  return gulp.src('../Maskinudlejning/Content/js/plugin/*')
    .pipe(concat('main.js'))
    .pipe(gulp.dest('../Maskinudlejning/Content/js'));
});

gulp.task('script', function() {
  return gulp.src(['../Maskinudlejning/Content/js/plugin/**','../Maskinudlejning/Content/js/**','!../Maskinudlejning/Content/js/main.js'])
    .pipe(concat('main.js'))
    .pipe(gulp.dest('../Maskinudlejning/Content/js'));
});
gulp.task('sass:watch', function () {
gulp.watch('../Maskinudlejning/Content/scss/**', ['sass']);
gulp.watch('../Maskinudlejning/Content/js/**', ['script']);
});