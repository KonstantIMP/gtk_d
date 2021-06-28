module shumate.NetworkTileSource;

private import glib.ConstructionException;
private import glib.Str;
private import glib.c.functions;
private import gobject.ObjectG;
private import shumate.TileSource;
private import shumate.c.functions;
public  import shumate.c.types;


/**
 * The #ShumateNetworkTileSource structure contains only private data
 * and should be accessed using the provided API
 */
public class NetworkTileSource : TileSource
{
	/** the main Gtk struct */
	protected ShumateNetworkTileSource* shumateNetworkTileSource;

	/** Get the main Gtk struct */
	public ShumateNetworkTileSource* getNetworkTileSourceStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return shumateNetworkTileSource;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)shumateNetworkTileSource;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (ShumateNetworkTileSource* shumateNetworkTileSource, bool ownedRef = false)
	{
		this.shumateNetworkTileSource = shumateNetworkTileSource;
		super(cast(ShumateTileSource*)shumateNetworkTileSource, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return shumate_network_tile_source_get_type();
	}

	/**
	 * Constructor of #ShumateNetworkTileSource.
	 *
	 * Params:
	 *     id = the map source's id
	 *     name = the map source's name
	 *     license = the map source's license
	 *     licenseUri = the map source's license URI
	 *     minZoom = the map source's minimum zoom level
	 *     maxZoom = the map source's maximum zoom level
	 *     tileSize = the map source's tile size (in pixels)
	 *     projection = the map source's projection
	 *     uriFormat = the URI to fetch the tiles from, see #shumate_network_tile_source_set_uri_format
	 *
	 * Returns: a constructed #ShumateNetworkTileSource object
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(string id, string name, string license, string licenseUri, uint minZoom, uint maxZoom, uint tileSize, ShumateMapProjection projection, string uriFormat)
	{
		auto __p = shumate_network_tile_source_new_full(Str.toStringz(id), Str.toStringz(name), Str.toStringz(license), Str.toStringz(licenseUri), minZoom, maxZoom, tileSize, projection, Str.toStringz(uriFormat));

		if(__p is null)
		{
			throw new ConstructionException("null returned by new_full");
		}

		this(cast(ShumateNetworkTileSource*) __p, true);
	}

	/**
	 * Gets the max number of allowed simultaneous connections for this tile
	 * source.
	 *
	 * Returns: the max number of allowed simultaneous connections for this tile
	 *     source.
	 */
	public int getMaxConns()
	{
		return shumate_network_tile_source_get_max_conns(shumateNetworkTileSource);
	}

	/**
	 * Gets offline status.
	 *
	 * Returns: TRUE when the tile source is set to be offline; FALSE otherwise.
	 */
	public bool getOffline()
	{
		return shumate_network_tile_source_get_offline(shumateNetworkTileSource) != 0;
	}

	/**
	 * Gets the proxy uri used to access network.
	 *
	 * Returns: the proxy uri
	 */
	public string getProxyUri()
	{
		return Str.toString(shumate_network_tile_source_get_proxy_uri(shumateNetworkTileSource));
	}

	/**
	 * Default constructor of #ShumateNetworkTileSource.
	 *
	 * Returns: A URI format used for URI creation when downloading tiles. See
	 *     shumate_network_tile_source_set_uri_format() for more information.
	 */
	public string getUriFormat()
	{
		return Str.toString(shumate_network_tile_source_get_uri_format(shumateNetworkTileSource));
	}

	/**
	 * Sets the max number of allowed simultaneous connections for this tile source.
	 *
	 * Before changing this remember to verify how many simultaneous connections
	 * your tile provider allows you to make.
	 *
	 * Params:
	 *     maxConns = the number of allowed simultaneous connections
	 */
	public void setMaxConns(int maxConns)
	{
		shumate_network_tile_source_set_max_conns(shumateNetworkTileSource, maxConns);
	}

	/**
	 * Sets offline status.
	 *
	 * Params:
	 *     offline = TRUE when the tile source should be offline; FALSE otherwise
	 */
	public void setOffline(bool offline)
	{
		shumate_network_tile_source_set_offline(shumateNetworkTileSource, offline);
	}

	/**
	 * Override the default proxy for accessing the network.
	 *
	 * Params:
	 *     proxyUri = the proxy uri used to access network
	 */
	public void setProxyUri(string proxyUri)
	{
		shumate_network_tile_source_set_proxy_uri(shumateNetworkTileSource, Str.toStringz(proxyUri));
	}

	/**
	 * A URI format is a URI where x, y and zoom level information have been
	 * marked for parsing and insertion.  There can be an unlimited number of
	 * marked items in a URI format.  They are delimited by "#" before and after
	 * the variable name. There are 4 defined variable names: X, Y, Z, and TMSY for
	 * Y in TMS coordinates.
	 *
	 * For example, this is the OpenStreetMap URI format:
	 * "http://tile.openstreetmap.org/\#Z\#/\#X\#/\#Y\#.png"
	 *
	 * Params:
	 *     uriFormat = the URI format
	 */
	public void setUriFormat(string uriFormat)
	{
		shumate_network_tile_source_set_uri_format(shumateNetworkTileSource, Str.toStringz(uriFormat));
	}

	/**
	 * Sets the User-Agent header used communicating with the server.
	 *
	 * Params:
	 *     userAgent = A User-Agent string
	 */
	public void setUserAgent(string userAgent)
	{
		shumate_network_tile_source_set_user_agent(shumateNetworkTileSource, Str.toStringz(userAgent));
	}
}
