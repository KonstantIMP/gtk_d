module gst.mpegts.DvbMultilingualServiceNameItem;

private import glib.MemorySlice;
private import glib.Str;
private import glib.c.functions;
private import gst.mpegts.c.functions;
public  import gst.mpegts.c.types;
private import linker.loader;


/**
 * a multilingual service name entry
 */
public final class DvbMultilingualServiceNameItem
{
	/** the main Gtk struct */
	protected GstMpegtsDvbMultilingualServiceNameItem* gstMpegtsDvbMultilingualServiceNameItem;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GstMpegtsDvbMultilingualServiceNameItem* getDvbMultilingualServiceNameItemStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstMpegtsDvbMultilingualServiceNameItem;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gstMpegtsDvbMultilingualServiceNameItem;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstMpegtsDvbMultilingualServiceNameItem* gstMpegtsDvbMultilingualServiceNameItem, bool ownedRef = false)
	{
		this.gstMpegtsDvbMultilingualServiceNameItem = gstMpegtsDvbMultilingualServiceNameItem;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_GSTMPEGTS[0]) && ownedRef )
			sliceFree(gstMpegtsDvbMultilingualServiceNameItem);
	}


	/**
	 * the ISO 639 language code
	 */
	public @property string languageCode()
	{
		return Str.toString(gstMpegtsDvbMultilingualServiceNameItem.languageCode);
	}

	/** Ditto */
	public @property void languageCode(string value)
	{
		gstMpegtsDvbMultilingualServiceNameItem.languageCode = Str.toStringz(value);
	}

	/**
	 * the provider name
	 */
	public @property string providerName()
	{
		return Str.toString(gstMpegtsDvbMultilingualServiceNameItem.providerName);
	}

	/** Ditto */
	public @property void providerName(string value)
	{
		gstMpegtsDvbMultilingualServiceNameItem.providerName = Str.toStringz(value);
	}

	/**
	 * the service name
	 */
	public @property string serviceName()
	{
		return Str.toString(gstMpegtsDvbMultilingualServiceNameItem.serviceName);
	}

	/** Ditto */
	public @property void serviceName(string value)
	{
		gstMpegtsDvbMultilingualServiceNameItem.serviceName = Str.toStringz(value);
	}

	/** */
	public static GType getType()
	{
		return gst_mpegts_dvb_multilingual_service_name_item_get_type();
	}
}
