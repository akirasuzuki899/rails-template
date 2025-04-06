FROM ruby:3.4
WORKDIR /myapp
COPY ./app/Gemfile /myapp/Gemfile
COPY ./app/Gemfile.lock /myapp/Gemfile.lock

# コンテナー起動時に毎回実行されるスクリプトを追加
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# イメージ実行時に起動させる主プロセスを設定
CMD ["rails", "server", "-b", "0.0.0.0"]