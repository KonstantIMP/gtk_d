module shumate.c.types;

public import gdk.c.types;
public import gio.c.types;
public import glib.c.types;
public import gobject.c.types;
public import gtk.c.types;


/**
 * Error codes in the #SHUMATE_FILE_CACHE_ERROR domain.
 */
public enum ShumateFileCacheError
{
	/**
	 * An unspecified error occurred during the operation.
	 */
	FAILED = 0,
}
alias ShumateFileCacheError FileCacheError;

/**
 * Projections supported by the library.
 */
public enum ShumateMapProjection
{
	/**
	 * Currently the only supported projection
	 */
	MERCATOR = 0,
}
alias ShumateMapProjection MapProjection;

/**
 * Error codes in the #SHUMATE_NETWORK_SOURCE_ERROR domain.
 */
public enum ShumateNetworkSourceError
{
	/**
	 * An unspecified error occurred during the operation.
	 */
	FAILED = 0,
	/**
	 * An unsuccessful HTTP response was received from the server.
	 */
	BAD_RESPONSE = 1,
	/**
	 * The server could not be reached.
	 */
	COULD_NOT_CONNECT = 2,
	/**
	 * The provided URL isn't valid
	 */
	MALFORMED_URL = 3,
	/**
	 * The tile source has been marked as offline.
	 */
	OFFLINE = 4,
}
alias ShumateNetworkSourceError NetworkSourceError;

/**
 * Tile loading state.
 */
public enum ShumateState
{
	/**
	 * Initial or undefined state
	 */
	NONE = 0,
	/**
	 * Tile is loading
	 */
	LOADING = 1,
	/**
	 * Tile is loaded but not yet displayed
	 */
	LOADED = 2,
	/**
	 * Tile loading finished. Also used to inform map sources
	 * that tile loading has been cancelled.
	 */
	DONE = 3,
}
alias ShumateState State;

/**
 * Units used by the scale.
 */
public enum ShumateUnit
{
	/**
	 * Both metric and imperial units
	 */
	BOTH = 0,
	/**
	 * Metric units (meters)
	 */
	METRIC = 1,
	/**
	 * Imperial units (miles)
	 */
	IMPERIAL = 2,
}
alias ShumateUnit Unit;

struct ShumateCompass;

struct ShumateCompassClass
{
	GtkWidgetClass parentClass;
}

struct ShumateCoordinate
{
	GObject parentInstance;
}

struct ShumateCoordinateClass
{
	GObjectClass parentClass;
}

struct ShumateFileCache
{
	GObject parentInstance;
}

struct ShumateFileCacheClass
{
	GObjectClass parentClass;
}

struct ShumateLayer
{
	GtkWidget parentInstance;
}

struct ShumateLayerClass
{
	GtkWidgetClass parentClass;
}

struct ShumateLicense;

struct ShumateLicenseClass
{
	GtkWidgetClass parentClass;
}

struct ShumateLocation;

/**
 * An interface common to objects having latitude and longitude.
 */
struct ShumateLocationInterface
{
	GTypeInterface gIface;
	/**
	 *
	 * Params:
	 *     location = a #ShumateLocation
	 * Returns: the latitude coordinate in degrees.
	 */
	extern(C) double function(ShumateLocation* location) getLatitude;
	/**
	 *
	 * Params:
	 *     location = a #ShumateLocation
	 * Returns: the longitude coordinate in degrees.
	 */
	extern(C) double function(ShumateLocation* location) getLongitude;
	/** */
	extern(C) void function(ShumateLocation* location, double latitude, double longitude) setLocation;
}

struct ShumateMap
{
	GtkWidget parentInstance;
}

struct ShumateMapClass
{
	GtkWidgetClass parentClass;
}

struct ShumateMapLayer;

struct ShumateMapLayerClass
{
	ShumateLayerClass parentClass;
}

struct ShumateMapSource
{
	GObject parentInstance;
}

struct ShumateMapSourceClass
{
	GObjectClass parentClass;
	/** */
	extern(C) void function(ShumateMapSource* self, ShumateTile* tile, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) fillTileAsync;
}

struct ShumateMapSourceRegistry;

struct ShumateMapSourceRegistryClass
{
	GObjectClass parentClass;
}

struct ShumateMarker
{
	GtkWidget parentInstance;
}

struct ShumateMarkerClass
{
	GtkWidgetClass parentClass;
}

struct ShumateMarkerLayer
{
	ShumateLayer parentInstance;
}

struct ShumateMarkerLayerClass
{
	ShumateLayerClass parentClass;
}

struct ShumateMemoryCache
{
	GObject parentInstance;
}

struct ShumateMemoryCacheClass
{
	GObjectClass parentClass;
}

struct ShumateNetworkTileSource
{
	ShumateMapSource parentInstance;
}

struct ShumateNetworkTileSourceClass
{
	ShumateMapSourceClass parentClass;
}

struct ShumatePathLayer
{
	ShumateLayer parentInstance;
}

struct ShumatePathLayerClass
{
	ShumateLayerClass parentClass;
}

struct ShumatePoint;

struct ShumatePointClass
{
	ShumateMarkerClass parentClass;
}

struct ShumateScale;

struct ShumateScaleClass
{
	GtkWidgetClass parentClass;
}

struct ShumateTile
{
	GtkWidget parentInstance;
}

struct ShumateTileClass
{
	GtkWidgetClass parentClass;
}

struct ShumateViewport;

struct ShumateViewportClass
{
	GObjectClass parentClass;
}

/**
 * The major version of libshumate (1, if %SHUMATE_VERSION is 1.2.3)
 */
enum MAJOR_VERSION = 0;
alias SHUMATE_MAJOR_VERSION = MAJOR_VERSION;

/**
 * Maps for Free Relief
 */
enum MAP_SOURCE_MFF_RELIEF = "mff-relief";
alias SHUMATE_MAP_SOURCE_MFF_RELIEF = MAP_SOURCE_MFF_RELIEF;

/**
 * OpenStreetMap Cycle Map
 */
enum MAP_SOURCE_OSM_CYCLE_MAP = "osm-cyclemap";
alias SHUMATE_MAP_SOURCE_OSM_CYCLE_MAP = MAP_SOURCE_OSM_CYCLE_MAP;

/**
 * OpenStreetMap Mapnik
 */
enum MAP_SOURCE_OSM_MAPNIK = "osm-mapnik";
alias SHUMATE_MAP_SOURCE_OSM_MAPNIK = MAP_SOURCE_OSM_MAPNIK;

/**
 * OpenStreetMap Transport Map
 */
enum MAP_SOURCE_OSM_TRANSPORT_MAP = "osm-transportmap";
alias SHUMATE_MAP_SOURCE_OSM_TRANSPORT_MAP = MAP_SOURCE_OSM_TRANSPORT_MAP;

/**
 * OpenWeatherMap clouds layer
 */
enum MAP_SOURCE_OWM_CLOUDS = "owm-clouds";
alias SHUMATE_MAP_SOURCE_OWM_CLOUDS = MAP_SOURCE_OWM_CLOUDS;

/**
 * OpenWeatherMap precipitation
 */
enum MAP_SOURCE_OWM_PRECIPITATION = "owm-precipitation";
alias SHUMATE_MAP_SOURCE_OWM_PRECIPITATION = MAP_SOURCE_OWM_PRECIPITATION;

/**
 * OpenWeatherMap sea level pressure
 */
enum MAP_SOURCE_OWM_PRESSURE = "owm-pressure";
alias SHUMATE_MAP_SOURCE_OWM_PRESSURE = MAP_SOURCE_OWM_PRESSURE;

/**
 * OpenWeatherMap temperature
 */
enum MAP_SOURCE_OWM_TEMPERATURE = "owm-temperature";
alias SHUMATE_MAP_SOURCE_OWM_TEMPERATURE = MAP_SOURCE_OWM_TEMPERATURE;

/**
 * OpenWeatherMap wind
 */
enum MAP_SOURCE_OWM_WIND = "owm-wind";
alias SHUMATE_MAP_SOURCE_OWM_WIND = MAP_SOURCE_OWM_WIND;

enum MAX_LATITUDE = 85.051129;
alias SHUMATE_MAX_LATITUDE = MAX_LATITUDE;

enum MAX_LONGITUDE = 180.000000;
alias SHUMATE_MAX_LONGITUDE = MAX_LONGITUDE;

/**
 * The micro version of libshumate (3, if %SHUMATE_VERSION is 1.2.3)
 */
enum MICRO_VERSION = 0;
alias SHUMATE_MICRO_VERSION = MICRO_VERSION;

/**
 * The minor version of libshumate (2, if %SHUMATE_VERSION is 1.2.3)
 */
enum MINOR_VERSION = 0;
alias SHUMATE_MINOR_VERSION = MINOR_VERSION;

enum MIN_LATITUDE = 85.051129;
alias SHUMATE_MIN_LATITUDE = MIN_LATITUDE;

enum MIN_LONGITUDE = 180.000000;
alias SHUMATE_MIN_LONGITUDE = MIN_LONGITUDE;

/**
 * The full version of libshumate, like 1.2.3
 */
enum VERSION = 0.000000;
alias SHUMATE_VERSION = VERSION;

/**
 * Numerically encoded version of libshumate, like 0x010203
 */
enum VERSION_HEX = 0;
alias SHUMATE_VERSION_HEX = VERSION_HEX;

/**
 * The full version of libshumate, in string form (suited for
 * string concatenation)
 */
enum VERSION_S = "0.0.0";
alias SHUMATE_VERSION_S = VERSION_S;
