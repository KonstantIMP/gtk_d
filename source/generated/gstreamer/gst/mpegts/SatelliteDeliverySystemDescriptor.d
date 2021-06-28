module gst.mpegts.SatelliteDeliverySystemDescriptor;

private import glib.MemorySlice;
private import gst.mpegts.c.functions;
public  import gst.mpegts.c.types;
private import linker.loader;


/**
 * Satellite Delivery System Descriptor (EN 300 468 v.1.13.1)
 */
public final class SatelliteDeliverySystemDescriptor
{
	/** the main Gtk struct */
	protected GstMpegtsSatelliteDeliverySystemDescriptor* gstMpegtsSatelliteDeliverySystemDescriptor;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GstMpegtsSatelliteDeliverySystemDescriptor* getSatelliteDeliverySystemDescriptorStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstMpegtsSatelliteDeliverySystemDescriptor;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gstMpegtsSatelliteDeliverySystemDescriptor;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstMpegtsSatelliteDeliverySystemDescriptor* gstMpegtsSatelliteDeliverySystemDescriptor, bool ownedRef = false)
	{
		this.gstMpegtsSatelliteDeliverySystemDescriptor = gstMpegtsSatelliteDeliverySystemDescriptor;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_GSTMPEGTS[0]) && ownedRef )
			sliceFree(gstMpegtsSatelliteDeliverySystemDescriptor);
	}


	/**
	 * the frequency in kHz (kiloHertz)
	 */
	public @property uint frequency()
	{
		return gstMpegtsSatelliteDeliverySystemDescriptor.frequency;
	}

	/** Ditto */
	public @property void frequency(uint value)
	{
		gstMpegtsSatelliteDeliverySystemDescriptor.frequency = value;
	}

	/**
	 * the orbital position in degrees
	 */
	public @property float orbitalPosition()
	{
		return gstMpegtsSatelliteDeliverySystemDescriptor.orbitalPosition;
	}

	/** Ditto */
	public @property void orbitalPosition(float value)
	{
		gstMpegtsSatelliteDeliverySystemDescriptor.orbitalPosition = value;
	}

	/**
	 * If %TRUE, the satellite is in the eastern part of the orbit,
	 * else in the western part.
	 */
	public @property bool westEast()
	{
		return gstMpegtsSatelliteDeliverySystemDescriptor.westEast != 0;
	}

	/** Ditto */
	public @property void westEast(bool value)
	{
		gstMpegtsSatelliteDeliverySystemDescriptor.westEast = value;
	}

	/**
	 * The polarization of the transmitted signal
	 */
	public @property GstMpegtsSatellitePolarizationType polarization()
	{
		return gstMpegtsSatelliteDeliverySystemDescriptor.polarization;
	}

	/** Ditto */
	public @property void polarization(GstMpegtsSatellitePolarizationType value)
	{
		gstMpegtsSatelliteDeliverySystemDescriptor.polarization = value;
	}

	/**
	 * Roll-off factor used in DVB-S2
	 */
	public @property GstMpegtsSatelliteRolloff rollOff()
	{
		return gstMpegtsSatelliteDeliverySystemDescriptor.rollOff;
	}

	/** Ditto */
	public @property void rollOff(GstMpegtsSatelliteRolloff value)
	{
		gstMpegtsSatelliteDeliverySystemDescriptor.rollOff = value;
	}

	/**
	 * modulation system, %TRUE if DVB-S2, else DVB-S
	 */
	public @property bool modulationSystem()
	{
		return gstMpegtsSatelliteDeliverySystemDescriptor.modulationSystem != 0;
	}

	/** Ditto */
	public @property void modulationSystem(bool value)
	{
		gstMpegtsSatelliteDeliverySystemDescriptor.modulationSystem = value;
	}

	/**
	 * Modulation scheme used
	 */
	public @property GstMpegtsModulationType modulationType()
	{
		return gstMpegtsSatelliteDeliverySystemDescriptor.modulationType;
	}

	/** Ditto */
	public @property void modulationType(GstMpegtsModulationType value)
	{
		gstMpegtsSatelliteDeliverySystemDescriptor.modulationType = value;
	}

	/**
	 * Symbol rate (in symbols per second)
	 */
	public @property uint symbolRate()
	{
		return gstMpegtsSatelliteDeliverySystemDescriptor.symbolRate;
	}

	/** Ditto */
	public @property void symbolRate(uint value)
	{
		gstMpegtsSatelliteDeliverySystemDescriptor.symbolRate = value;
	}

	/**
	 * inner FEC scheme used
	 */
	public @property GstMpegtsDVBCodeRate fecInner()
	{
		return gstMpegtsSatelliteDeliverySystemDescriptor.fecInner;
	}

	/** Ditto */
	public @property void fecInner(GstMpegtsDVBCodeRate value)
	{
		gstMpegtsSatelliteDeliverySystemDescriptor.fecInner = value;
	}

	/** */
	public static GType getType()
	{
		return gst_mpegts_satellite_delivery_system_descriptor_get_type();
	}
}
