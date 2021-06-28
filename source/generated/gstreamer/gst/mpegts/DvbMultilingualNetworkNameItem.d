module gst.mpegts.DvbMultilingualNetworkNameItem;

private import glib.MemorySlice;
private import glib.Str;
private import glib.c.functions;
private import gst.mpegts.c.functions;
public  import gst.mpegts.c.types;
private import linker.loader;


/**
 * a multilingual network name entry
 */
public final class DvbMultilingualNetworkNameItem
{
	/** the main Gtk struct */
	protected GstMpegtsDvbMultilingualNetworkNameItem* gstMpegtsDvbMultilingualNetworkNameItem;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GstMpegtsDvbMultilingualNetworkNameItem* getDvbMultilingualNetworkNameItemStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstMpegtsDvbMultilingualNetworkNameItem;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gstMpegtsDvbMultilingualNetworkNameItem;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstMpegtsDvbMultilingualNetworkNameItem* gstMpegtsDvbMultilingualNetworkNameItem, bool ownedRef = false)
	{
		this.gstMpegtsDvbMultilingualNetworkNameItem = gstMpegtsDvbMultilingualNetworkNameItem;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_GSTMPEGTS[0]) && ownedRef )
			sliceFree(gstMpegtsDvbMultilingualNetworkNameItem);
	}


	/**
	 * the ISO 639 language code
	 */
	public @property string languageCode()
	{
		return Str.toString(gstMpegtsDvbMultilingualNetworkNameItem.languageCode);
	}

	/** Ditto */
	public @property void languageCode(string value)
	{
		gstMpegtsDvbMultilingualNetworkNameItem.languageCode = Str.toStringz(value);
	}

	/**
	 * the network name
	 */
	public @property string networkName()
	{
		return Str.toString(gstMpegtsDvbMultilingualNetworkNameItem.networkName);
	}

	/** Ditto */
	public @property void networkName(string value)
	{
		gstMpegtsDvbMultilingualNetworkNameItem.networkName = Str.toStringz(value);
	}

	/** */
	public static GType getType()
	{
		return gst_mpegts_dvb_multilingual_network_name_item_get_type();
	}
}
