#-------------------------------------------------
#
# Project created by QtCreator 2014-06-17T16:26:25
#
#-------------------------------------------------

QT       -= gui

TARGET = torrent
TEMPLATE = lib
CONFIG += staticlib

DEFINES += BOOST_ASIO_SEPARATE_COMPILATION \
           BOOST_ASIO_ENABLE_CANCELIO \
           BOOST_ASIO_HASH_MAP_BUCKETS=1021 \
           BOOST_FILESYSTEM_VERSION=3 \
           WITH_SHIPPED_GEOIP_H \
           TORRENT_BUILDING_STATIC \
           TORRENT_USE_OPENSSL \
           TORRENT_DEBUG \
           TORRENT_VERBOSE_LOGGING

SOURCES += \
libtorrent/src/kademlia/dht_tracker.cpp \
libtorrent/src/kademlia/find_data.cpp \
libtorrent/src/kademlia/get_item.cpp \
libtorrent/src/kademlia/get_peers.cpp \
libtorrent/src/kademlia/item.cpp \
libtorrent/src/kademlia/logging.cpp \
libtorrent/src/kademlia/node_id.cpp \
libtorrent/src/kademlia/node.cpp \
libtorrent/src/kademlia/refresh.cpp \
libtorrent/src/kademlia/routing_table.cpp \
libtorrent/src/kademlia/rpc_manager.cpp \
libtorrent/src/kademlia/traversal_algorithm.cpp \
libtorrent/src/alert_manager.cpp \
libtorrent/src/alert.cpp \
libtorrent/src/allocator.cpp \
libtorrent/src/asio_ssl.cpp \
libtorrent/src/asio.cpp \
libtorrent/src/assert.cpp \
libtorrent/src/bandwidth_limit.cpp \
libtorrent/src/bandwidth_manager.cpp \
libtorrent/src/bandwidth_queue_entry.cpp \
libtorrent/src/bloom_filter.cpp \
libtorrent/src/broadcast_socket.cpp \
libtorrent/src/bt_peer_connection.cpp \
libtorrent/src/chained_buffer.cpp \
libtorrent/src/connection_queue.cpp \
libtorrent/src/ConvertUTF.cpp \
libtorrent/src/create_torrent.cpp \
libtorrent/src/disk_buffer_holder.cpp \
libtorrent/src/disk_buffer_pool.cpp \
libtorrent/src/disk_io_thread.cpp \
libtorrent/src/entry.cpp \
libtorrent/src/enum_net.cpp \
libtorrent/src/error_code.cpp \
libtorrent/src/escape_string.cpp \
libtorrent/src/file_pool.cpp \
libtorrent/src/file_storage.cpp \
libtorrent/src/file.cpp \
libtorrent/src/GeoIP.c \
libtorrent/src/gzip.cpp \
libtorrent/src/hasher.cpp \
libtorrent/src/http_connection.cpp \
libtorrent/src/http_parser.cpp \
libtorrent/src/http_seed_connection.cpp \
libtorrent/src/http_stream.cpp \
libtorrent/src/http_tracker_connection.cpp \
libtorrent/src/i2p_stream.cpp \
libtorrent/src/identify_client.cpp \
libtorrent/src/instantiate_connection.cpp \
libtorrent/src/ip_filter.cpp \
libtorrent/src/ip_voter.cpp \
libtorrent/src/lazy_bdecode.cpp \
libtorrent/src/logger.cpp \
libtorrent/src/lsd.cpp \
libtorrent/src/lt_trackers.cpp \
libtorrent/src/magnet_uri.cpp \
libtorrent/src/metadata_transfer.cpp \
libtorrent/src/mpi.c \
libtorrent/src/natpmp.cpp \
libtorrent/src/packet_buffer.cpp \
libtorrent/src/parse_url.cpp \
libtorrent/src/pe_crypto.cpp \
libtorrent/src/peer_connection.cpp \
libtorrent/src/piece_picker.cpp \
libtorrent/src/policy.cpp \
libtorrent/src/puff.cpp \
libtorrent/src/random.cpp \
libtorrent/src/rss.cpp \
libtorrent/src/session_impl.cpp \
libtorrent/src/session.cpp \
libtorrent/src/settings.cpp \
libtorrent/src/sha1.cpp \
libtorrent/src/smart_ban.cpp \
libtorrent/src/socket_io.cpp \
libtorrent/src/socket_type.cpp \
libtorrent/src/socks5_stream.cpp \
libtorrent/src/stat.cpp \
libtorrent/src/storage.cpp \
libtorrent/src/string_util.cpp \
libtorrent/src/thread.cpp \
libtorrent/src/time.cpp \
libtorrent/src/timestamp_history.cpp \
libtorrent/src/torrent_handle.cpp \
libtorrent/src/torrent_info.cpp \
libtorrent/src/torrent.cpp \
libtorrent/src/tracker_manager.cpp \
libtorrent/src/udp_socket.cpp \
libtorrent/src/udp_tracker_connection.cpp \
libtorrent/src/upnp.cpp \
libtorrent/src/ut_metadata.cpp \
libtorrent/src/ut_pex.cpp \
libtorrent/src/utf8.cpp \
libtorrent/src/utp_socket_manager.cpp \
libtorrent/src/utp_stream.cpp \
libtorrent/src/version.cpp \
libtorrent/src/web_connection_base.cpp \
libtorrent/src/web_peer_connection.cpp \
libtorrent/src/xml_parse.cpp \
libtorrent/ed25519/src/add_scalar.cpp \
libtorrent/ed25519/src/fe.cpp \
libtorrent/ed25519/src/ge.cpp \
libtorrent/ed25519/src/key_exchange.cpp \
libtorrent/ed25519/src/keypair.cpp \
libtorrent/ed25519/src/sc.cpp \
libtorrent/ed25519/src/seed.cpp \
libtorrent/ed25519/src/sha512.cpp \
libtorrent/ed25519/src/sign.cpp \
libtorrent/ed25519/src/verify.cpp

HEADERS +=
unix {
    target.path = /usr/lib
    INSTALLS += target
}

iphoneos {
  CONFIG(debug, debug|release) {
    DESTDIR = iphoneos/debug
  }

  CONFIG(release, debug|release) {
    DESTDIR = iphoneos/release
  }

  OBJECTS_DIR = $$DESTDIR/.obj
  MOC_DIR = $$DESTDIR/.moc
  RCC_DIR = $$DESTDIR/.qrc
  UI_DIR = $$DESTDIR/.u
}

iphonesimulator {
  CONFIG(debug, debug|release) {
    DESTDIR = iphonesimulator/debug
  }

  CONFIG(release, debug|release) {
    DESTDIR = iphonesimulator/release
  }

  OBJECTS_DIR = $$DESTDIR/.obj
  MOC_DIR = $$DESTDIR/.moc
  RCC_DIR = $$DESTDIR/.qrc
  UI_DIR = $$DESTDIR/.u
}

INCLUDEPATH += $$PWD/libtorrent/include
DEPENDPATH += $$PWD/libtorrent/include

INCLUDEPATH += $$PWD/boost/prefix/include
DEPENDPATH += $$PWD/boost/prefix/include

LIBS += -L$$PWD/boost/prefix/lib -lboost_system -lboost_filesystem -lboost_asio -lcrypto

