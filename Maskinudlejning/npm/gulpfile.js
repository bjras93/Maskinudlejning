var gulp = require('gulp'),
    sass = require('gulp-sass'),
    concat = require('gulp-concat'),
    uglify = require('gulp-uglify');
gulp.task('sass', function () {
  return gulp.src('../Maskinudlejning/Content/scss/main.scss')
    .pipe(sass({outputStyle: 'compressed'}).on('error', sass.logError))
    .pipe(gulp.dest('../Maskinudlejning/Content/css'));
});
 
gulp.task('scripts', function() {
  return gulp.src('../Maskinudlejning/Content/js/plugin/*')
    .pipe(concat('main.js'))
    .pipe(gulp.dest('../Maskinudlejning/Content/js'));
});

gulp.task('script', function() {
  return gulp.src([
          '../Maskinudlejning/Content/js/plugin/jquery-1.12.2.min.js',
          '../Maskinudlejning/Content/js/plugin/angular.min.js',
          '../Maskinudlejning/Content/js/plugin/jquery.tablesorter.min.js',
          '../Maskinudlejning/Content/js/base/**'      
  ])
    .pipe(concat('main.js'))
  .pipe(uglify())
    .pipe(gulp.dest('../Maskinudlejning/Content/js'));
});
gulp.task('sass:watch', function () {
gulp.watch('../Maskinudlejning/Content/scss/**', ['sass']);
gulp.watch(['../Maskinudlejning/Content/js/base/**','../Maskinudlejning/Content/js/plugin/**' ], ['script']);
});