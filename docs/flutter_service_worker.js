'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "a0a65b3cf0c2067a52dec567aa1bd693",
"assets/AssetManifest.bin.json": "98fc39bea2505b2bb4fbda01720485c6",
"assets/assets/android.png": "b1c9c03c20636e9c447d0e366545b450",
"assets/assets/bloc.png": "977fbfba561065f9a68c4b47f9774531",
"assets/assets/css.png": "9d089bd0b10be9772b151c76fabe85ca",
"assets/assets/dart.png": "918e7c35823c7ad268ba831c6e7eaa64",
"assets/assets/desktop.png": "4ecbe26b2267b20055fec31b8d66b57d",
"assets/assets/firebase.png": "36170822afe4c716cfbdb96dac8cd10e",
"assets/assets/flutter.png": "1eecfb7c8b8427c77f428584b22cc534",
"assets/assets/github.png": "2ca467ca34b1bb84b50dab46e6988c41",
"assets/assets/html5.png": "27b0afc8d7069fad77a6ece74eeb7e83",
"assets/assets/ios.png": "62e7d874c532a9c960aeb1eff004462f",
"assets/assets/js.png": "e92c50101aeeb68f3eb251ca9a91ab81",
"assets/assets/loading.gif": "a2dc9668f2cf170fe3efeb263128b0e7",
"assets/assets/profile.png": "ff405b7b59a5adc9d4526cffc32ec9af",
"assets/assets/projects/adijorda%2520(2).png": "d6b1abc3e7d595d3709080839ac37062",
"assets/assets/projects/adijorda%2520(3).png": "ef6e9e0e90af5a1873538e871cdae3ec",
"assets/assets/projects/adijorda.png": "6c334479a0db8c762ba5235c8f99552c",
"assets/assets/projects/delivery-food.png": "033721adf3c071104ab5f3ac1673307f",
"assets/assets/projects/foodtopia.jpeg": "3917ba7ecd0230a2155431ab1e89c317",
"assets/assets/projects/foodtopia1.jpeg": "26a8bf9419f12d545498333923cb03b9",
"assets/assets/projects/foodtopia2.jpeg": "1d92ffb752946b7518fa2cac6bac1cec",
"assets/assets/projects/foodtopia3.jpeg": "65413ba681a06a9bc685815c65d2f2ab",
"assets/assets/projects/millorcase.jpg": "72e9e930bd3153c06d1bdd61616b8d4c",
"assets/assets/projects/news%2520(2).png": "b354ac6bdf42ef812a922ca28561f336",
"assets/assets/projects/news.png": "eb2c41d982dc869ede119ce394e4c9a5",
"assets/assets/projects/practice%2520(2).png": "86af824d6e00b6b75b026010e65ed942",
"assets/assets/projects/practice%2520(3).png": "89614a272770a3e7ae62e28090d3cd62",
"assets/assets/projects/practice.png": "69ab416bb19ae0dfa05314c1c0657b4b",
"assets/assets/projects/shopping.png": "fd34ccd9bc970eadf60516a156049893",
"assets/assets/ts.png": "28f1107c023f7b63682af01151071e22",
"assets/assets/web.png": "bf1514091621cdb96b81c9d04cdc0e96",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "6b5c943599912850d58fbbdc6a37f79c",
"assets/NOTICES": "c1fc0ff1f77f59c70ec244f6f963d307",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/shaders/stretch_effect.frag": "40d68efbbf360632f614c731219e95f0",
"canvaskit/canvaskit.js": "8331fe38e66b3a898c4f37648aaf7ee2",
"canvaskit/canvaskit.js.symbols": "a3c9f77715b642d0437d9c275caba91e",
"canvaskit/canvaskit.wasm": "9b6a7830bf26959b200594729d73538e",
"canvaskit/chromium/canvaskit.js": "a80c765aaa8af8645c9fb1aae53f9abf",
"canvaskit/chromium/canvaskit.js.symbols": "e2d09f0e434bc118bf67dae526737d07",
"canvaskit/chromium/canvaskit.wasm": "a726e3f75a84fcdf495a15817c63a35d",
"canvaskit/skwasm.js": "8060d46e9a4901ca9991edd3a26be4f0",
"canvaskit/skwasm.js.symbols": "3a4aadf4e8141f284bd524976b1d6bdc",
"canvaskit/skwasm.wasm": "7e5f3afdd3b0747a1fd4517cea239898",
"canvaskit/skwasm_heavy.js": "740d43a6b8240ef9e23eed8c48840da4",
"canvaskit/skwasm_heavy.js.symbols": "0755b4fb399918388d71b59ad390b055",
"canvaskit/skwasm_heavy.wasm": "b0be7910760d205ea4e011458df6ee01",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "24bc71911b75b5f8135c949e27a2984e",
"flutter_bootstrap.js": "a3564bc7b249fcac68ebe41b685ebf91",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "862c1253e9a9e141b519af29f433f1b4",
"/": "862c1253e9a9e141b519af29f433f1b4",
"main.dart.js": "f06bdc7dd99bb2c0f6ef06984d7b7067",
"manifest.json": "a2e663b7ce00debff628a06023f8bf6f",
"version.json": "038eeb21ccc77b35d6751844670f87d7"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
